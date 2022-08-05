class ApplicationController < ActionController::Base
 include SessionsHelper

 helper_method :logged_in?, :current_user
end
