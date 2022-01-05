class DonationsController < ApplicationController
    # * Paso 2: se agregan los require para poder setear la información que irá a MACH
    require 'json'
    require 'net/http'
    require 'uri'
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!, only: [:webhook]

    before_action :set_donation, only: [:show, :edit, :update, :destroy, :check_donation]
    before_action :set_cause, only: [:new, :create, :update]
    
    def index
        @donations = Donation.all   
    end

    def show
        @qrcode = RQRCode::QRCode.new(@donation.payment_url)

        @svg = @qrcode.as_svg(
            offset: 0,
            color: '000',
            shape_rendering: 'crispEdges',  
            module_size: 6
        )
    end

    def new
        @donation = Donation.new
        @points = Point.all.order(:price)
    end

    def create        
        @donation =  Donation.new(donation_params)
        @donation.status = "pending"
        @donation.cause = @cause
        @donation.user = current_user
        @donation.title = @cause.title
        @donation.message = "Donando por #{current_user.email}"
        #calculo de dinero a donar
        @donation.amount = Point.find(params[:donation][:point_id]).price * @donation.quantity

        #* Paso 1. se configura los datos que se enviarán a MACH
        payload = JSON.dump({ 
            payment: {
                amount: @donation.amount,
                message: @donation.message,
                title: @donation.title,
            }
        })

        #* Paso 3. se agrega la ruta a la que queremos llegar para hacerle un fetch
        url = URI("https://biz.soymach.com/payments")

        #* Paso 4. biblioteca http
        http = Net::HTTP.new(url.host, url.port)
        #agregar que sea https
        http.use_ssl = true

        #* Paso 5. crear el request
        #Seteo de headers
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        #CUANDO SE PASE A PRODUCCIÓN AGREGAR LA VARIABLE DE ENTORNO DE PRODUCCION. VER .ENV
        request["Authorization"] = ENV['MACH_KEY_PRODUCTION']
        #Seteo de body
        request.body = payload
        response = http.request(request)
        #Parse response
        response_body = JSON.parse(response.body)
        #acá el código de la donación será igual al token de la respuesta entregada por mach para esa transacción
        @donation.code = response_body["token"]
        @donation.payment_url = response_body["url"]
        
        #responder en formato html si se guarda la donación
        respond_to do |format|
            if @donation.save!
                format.html { redirect_to cause_donation_path(@cause, @donation), notice: "La donación se ha creado exitosamente."}
            end
        end
    end

    #* Paso 6. se configura el webhook en mach
    #! WEBHOOK NO FUNCIONA EN LOCAL - SOLO EN PRODUCCION
    #TODO: AGREGAR LA NUEVA RUTA AL WEBHOOK CUANDO SE SUBA A UN DOMINIO/CONFIRMATION
    #TODO: CREAR LAS LLAVES PARA MARCH DE PRODUCCIÓN Y AGREGARLAS AL .ENV

    def webhook
        donation = Donation.find_by(code: params["event_resource_id"])
        case params["event_name"] == "business-payment-completed"
        when true
            donation.status = "approved"
            donation.save!
            render json: {
                success: true,
                message: "Donation completed."
            }, status: 200
        else
            donation.status = "rejected"
            donation.save!
            render json: {
                success: true,
                message: "Donation not completed."
            }, status: 200
        end
    end

    #* Paso 8. se realiza un request de tipo get para saber el estado de la transacción con mach
    def check_donation
        url = URI("https://biz.soymach.com/payments/#{@donation.code}") 
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        
        request = Net::HTTP::Get.new(url)
        request["Authorization"] = ENV["MACH_KEY_PRODUCTION"] 

        response = http.request(request)
        response_body = JSON.parse(response.body)

        respond_to do |format|
            if response_body["status"] == "CONFIRMED" || response_body["status"] == "COMPLETED"
                format.html { redirect_to root_path, notice: "Pago realizado. #{@donation.status}"}
            elsif response_body["status"] == "PENDING"
                format.html { redirect_to @donation, notice: "Pago pendiente. #{@donation.status}"}
            else
                format.html { redirect_to @donation, notice: "Pago no realizado. #{@donation.status}"}
            end
        end
    end

    private

    def donation_params
        params.require(:donation).permit(:quantity, :amount, :title, :status, :message, :user_id, :cause_id, :point_id)
    end

    def set_donation
        @donation = Donation.find(params[:id])
    end

    def set_cause
        @cause =  Cause.find(params[:cause_id])
    end
end