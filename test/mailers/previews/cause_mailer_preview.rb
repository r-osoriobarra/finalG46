# Preview all emails at http://localhost:3000/rails/mailers/cause_mailer
class CauseMailerPreview < ActionMailer::Preview
    def new_cause_email
        # Set up a temporary order for the preview
        cause = Cause.new(
            title: "Un aporte a tu vida", 
            start_date: "10-11-2021", 
            end_date: "10-12-2021", 
            reward: "un helao",
            project_id: 1,
        )    
        CauseMailer.with(cause: cause).new_cause_email
    end
end
