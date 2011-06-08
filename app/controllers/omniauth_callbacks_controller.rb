class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
    handle_omniauth_login "facebook", 'devise.facebook_data'
  end
   
  def open_id
    @user = User.find_for_openid_oauth(env['omniauth.auth'], current_user)
    handle_omniauth_login "Google", 'devise.openid_data'
  end
  
  def handle_omniauth_login omniauth_provider, session_key
    if @user.persisted?
      flash[:notice] = "Everything worked!~"#I18n.t 'devise.omniauth_callbacks.success', :kind => omniauth_provider
      sign_in_and_redirect @user, :event => :authentication
    else
      session[session_key] = env['omniauth.auth']
      redirect_to new_user_registration_path
    end    
  end  
end
