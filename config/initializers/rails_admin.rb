def assign_display_name_method(config, *models)
  models.each do |model|
    config.model model do
      object_label_method do
        :display_name
      end
    end
  end
end

RailsAdmin.config do |config|
  require 'money-rails/rails_admin'

  app_name = ENV.fetch("APP_NAME") { "Delivery Service" }
  config.main_app_name = [app_name, "BackOffice"]

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan, AdminAbility

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.parent_controller = 'AdminController'
  
  assign_display_name_method(config, 'User')
end
