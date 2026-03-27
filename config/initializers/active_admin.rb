ActiveAdmin.setup do |config|
  config.site_title = "Prairie Tech Market Admin"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete
  config.root_to = "dashboard#index"
end
