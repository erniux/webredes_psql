class ApplicationController < ActionController::Base	
   protect_from_forgery with: :exception

   include DeviseWhitelist
   include AliadaCopyright
   include CertRoutes
end