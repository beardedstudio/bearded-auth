Rails.application.routes.draw do  
  devise_for :users, :path => "sessions", :controllers => { :omniauth_callbacks => "omniauth_callbacks"}, :module => "devise", :class => "User" do

    get "sign_in", :to => "devise/sessions#new", :as => "sign_in"
    get "sign_out", :to => "devise/sessions#destroy", :as => "sign_out"

  end
  
    
end