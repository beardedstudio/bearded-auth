module Devise
  module Controllers
    module Helpers
      # Alias the generated devise helper methods (with namespaces) to the generic versions we are used to
      alias_method :authenticate_user!, :authenticate_bearded_user!
      alias_method :current_user, :current_bearded_user
      alias_method :user_signed_in?, :bearded_user_signed_in?
      alias_method :user_session, :bearded_user_session
    end
  end
end
