class ApplicationController < ActionController::Base
	 
	
   include DeviseWhitelist
   include AliadaCopyright
   include CertRoutes
end