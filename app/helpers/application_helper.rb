module ApplicationHelper
  def app_name
    ENV.fetch("APP_NAME") { "Delivery Service" }
  end
end
