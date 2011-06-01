== Bearded::Auth

Bearded-auth is a reusable engine comprising of commonly used routes, callbacks, and model additions for a devise-based authentication solution which supports google openid, facebook oauth, and custom logins (email/password combination).  It contains necessary controller actions and model extensions for recovering/changing passwords, logging in and out (either via a form or google/facebook/openid callbacks), registration, etc.

Devise still requires an initializer, which can be generated in the rails app which includes this gem:

  rails generate devise:install
  
Since configuration options for your app are going to need to be specific, you may edit the devise initializer in your own app to make necessary changes. For more information on devise:

https://github.com/plataformatec/devise