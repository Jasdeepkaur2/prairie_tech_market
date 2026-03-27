ActiveAdmin.setup do |config|
  config.site_title = "Prairie Tech Market Admin"
  config.site_title_link = "/"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete
  config.root_to = "dashboard#index"

  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      menu.add label: "View Store", url: "/", priority: 100
    end
  end
end
