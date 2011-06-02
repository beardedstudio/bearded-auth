Rails.application.routes.draw do  
  namespace :bearded do
    devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks"}, :module => "devise", :class_name => "Bearded::User"
  end
end