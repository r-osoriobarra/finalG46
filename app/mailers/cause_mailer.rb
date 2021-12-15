class CauseMailer < ApplicationMailer
    def new_cause_email
        @cause = params[:cause]
    
        mail(to: "#{@cause.project.user.email}", subject: "Se ha creado una nueva causa!")
    end
end
#TODO: pasar correo por variable de entorno
