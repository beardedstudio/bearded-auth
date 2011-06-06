== Bearded::Auth

Bearded-auth is a reusable engine comprising of commonly used routes, callbacks, and model additions for a devise-based authentication solution which supports google openid, facebook oauth, and custom logins (email/password combination).  It contains necessary controller actions and model extensions for recovering/changing passwords, logging in and out (either via a form or google/facebook/openid callbacks), registration, etc.

To install the engine, just add the Bearded::Auth gem to your gemfile: 

  gem 'bearded-auth', :git => 'git@dev.beardedstudio.com:bearded-auth.git'

Devise still requires an initializer, since configurations on a per-app basis will change.  Try the following to generate one, you must add oauth-/openid-related items yourself. Read up more on devise if this is unclear: https://github.com/plataformatec/devise

  rails generate devise:install
  vim config/initializers/devise.rb
  
If you are using google openid solutions, webrick may not like the url it calls for authentication (too many characters).  You should use another server that can handle very long urls (thin, etc).

Then edit your app to correctly set at least the following:

  config/routes.rb
  - You MUST map a root path for everything to work properly.
  
  config/environments/*.rb
  - Make SURE you set config.action_mailer.default_url_options = {:host => 'server_name:port_num'} to let devise's automatic emails work correctly.
  
  migrations
  - Devise migration should look like the following (Name and facebook_id used for openId solutions, may skip if you don't need):
  class CreateUsers < ActiveRecord::Migration
    def change
      create_table :users, :force => true do |t|
        t.string :name
        t.integer :facebook_id
        t.database_authenticatable
        t.confirmable
        t.recoverable
        t.rememberable
        t.trackable
        t.timestamps
      end
    end
  end
  
Then `rake db:migrate`, run your server, try localhost:3000/bearded/users/sign_in - you must build a custom link to google login via openid, but the facebook link should work on the sign-in page.  Also note that devise helpers (`current_user`, `user_signed_in?`, etc) are now namespaced (`current_bearded_user` and `bearded_user_signed_in?`).We suggest you alias them yourself in your ApplicationController. Route helpers defined in the engine are also namespaced: (bearded_user_omniauth_authorize_path, new_bearded_user_registration_path, etc)

Since devise emails confirmations to new users, the first time you try to login via Omniauth, devise will dump the source of the confirmation email in your development.log - it is easiest to copy the link from there and visit it in your browser.  Confirming your new user will also log you in - from then on correctly-formatted sign-in links should work as expected.