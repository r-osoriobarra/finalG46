#TODO: PROBAR LA APP CON DONATIONS EN PRODUCCION- SUBIR A HEROKU, GENERAR LLAVES Y AGREGAR RUTAS AL WEBHOOK EN MACH
#TODO: RELACIONAR DONATIONS CON CAUSES Y POINTS
#TODO: CREAR UN METODO QUE VAYA DESCONTANDO LOS PUNTOS DE CADA CAUSA SI ES QUE SE REALIZA CON EXITO UNA DONACION
#TODO: AGREGAR VARIABLES DE ENTORNO A LA APP EN HEROKU PARA VER VALIDACION DE FACEBOOK
#TODO: AGREGAR MAILER A LA APPLICACION

class DonationsController < ApplicationController
    #TODO: 2 se agregan los require para poder setear la información que irá a MACH
    require 'json'
    require 'net/http'
    require 'uri'
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!, only: [:webhook]

    before_action :set_donation, only: [:show, :edit, :update, :destroy, :check_donation]
    
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
    end

    def edit
    end

    def create
        @donation =  Donation.new(donation_params)
        @donation.status = "pending"
        #TODO: 1. se configura los datos que se enviarán a MACH
        payload = JSON.dump({ 
            payment: {
                amount: @donation.amount,
                message: @donation.message,
                title: @donation.title,
            }
        })
        #TODO: 3. se agrega la ruta a la que queremos llegar para hacerle un fetch
        #cambiar la ruta para cuando se habilite la cuenta en match (quitar el "-sandbox")
        url = URI("https://biz-sandbox.soymach.com/payments")

        #TODO: 4. biblioteca http
        http = Net::HTTP.new(url.host, url.port)
        #agregar que sea https
        http.use_ssl = true

        #TODO: 6. crear el request
        #Seteo de headers
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        #CUANDO SE PASE A PRODUCCIÓN AGREGAR LA VARIABLE DE ENTORNO DE PRODUCCION. VER .ENV
        request["Authorization"] = ENV['MACH_KEY_SANDBOX']
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
                format.html { redirect_to @donation, notice: "La donación se ha creado exitosamente."}
            end
        end
    end

    def update
        respond_to do |format|
            if @donation.update(donation_params)                
                format.html { redirect_to @donation, notice: "La donación se ha actualizado exitosamente." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @donation.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: "La donación se ha borrado." }
        end
    end 
    
    #TODO: 7. se configura el webhook en mach
    #WEBHOOK NO FUNCIONA EN LOCAL - SOLO EN PRODUCCION
    #AGREGAR LA NUEVA RUTA AL WEBHOOK CUANDO SE SUBA A UN DOMINIO/CONFIRMATION
    #CREAR LAS LLAVES PARA MARCH DE PRODUCCIÓN Y AGREGARLAS AL .ENV

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

    #TODO: 8. se realiza un request de tipo get para saber el estado de la transacción con mach
    def check_donation
        #cambiar la url a la de producción
        url = URI("https://biz-sandbox.soymach.com/payments/#{@donation.code}") 
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        request["Authorization"] = ENV["MACH_KEY_SANDBOX"] #CAMBIAR LLAVE A PRODUCCIÓN CUANDO SE SUBA EL PROYECTO

        response = http.request(request)
        response_body = JSON.parse(response.body)

        respond_to do |format|
            if response_body["status"] == "CONFIRMED" || response_body["status"] == "COMPLETED"
                format.html { redirect_to root_path, notice: "Pago realizado."}
            elsif response_body["status"] == "PENDING"
                format.html { redirect_to @donation, notice: "Pago pendiente."}
            else
                format.html { redirect_to @donation, notice: "Pago no realizado"}
            end
        end
    end

    private

    def donation_params
        params.require(:donation).permit(:amount, :title, :status, :message)
    end

    def set_donation
        @donation = Donation.find(params[:id])
    end
end