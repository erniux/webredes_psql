class ApplicationController < ActionController::Base
	protect_from_forgery 
	
   include DeviseWhitelist
   include AliadaCopyright
   include CertRoutes
end