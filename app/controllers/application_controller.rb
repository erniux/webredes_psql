class ApplicationController < ActionController::Base
	protect_from_forgery 

	before_action :authenticate_user!
	
   include DeviseWhitelist
   include AliadaCopyright
   include CertRoutes
end