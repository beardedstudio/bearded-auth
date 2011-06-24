class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :recoverable, 
         :rememberable, 
         :trackable, 
         :registerable,
         :omniauthable,
         :validatable


  #########################
  # OAuth methods
  #########################
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['user_info']
    user = User.find_by_facebook_id(access_token['uid'])
    user = User.find_by_email(data['email']) if user.nil?
    if user 
      user.update_facebook_info_from_access_token data
      user
    else # Create a user with a stub password. 
      User.create!( :facebook_id => access_token['uid'],
                    :email => data["email"], 
                    :name => data["name"], 
                    :password => Devise.friendly_token[0,20])
    end
  end

  def self.find_for_openid_oauth(access_token, signed_in_resource=nil)
    data = access_token['user_info']
    if user = User.find_by_email(data["email"])
      user
    # Create a user with a stub password. 
    else 
      User.create!( :email => data["email"], 
                    :name => data["name"], 
                    :password => Devise.friendly_token[0,20]) 
    end
  end

  def update_facebook_info_from_access_token data
    need_save = false

    if self.name != data['name']
      need_save = true
      self.name = data['name'] 
    end

    if self.email != data['email']
      need_save = true
      self.email = data['email']
    end

    self.save if need_save
  end
end
