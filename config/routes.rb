Rails.application.routes.draw do

  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :escuelas
  resources :certificadors
  resources :cert_escolars do
    delete :delete_upload_attachment
  end
  get 'escuela_dashboard', to: 'cert_escolars#show_escuela'
  resources :acercade_certificates
  resources :preguntas_certs
  resources :estandar_etapa_certificacions
  resources :etapa_certificacions
  resources :reconocimiento_redes
  resources :avisos 
  resources :eventos
  resources :recursos
  resources :precios
  resources :acercades
    
  devise_for :users, path: '',path_names: {sign_in: 'ingresar', sign_out: 'salir', sign_up: 'registro'}


  resources :contactos, only: [:create, :new]
  post "contactos/new"
  get "paginas/contacto"

  

  get 'acerca_de', to: 'paginas#acerca_de'
  get 'socios', to: 'paginas#socios'
  get 'precios', to: 'paginas#precios'
  get 'contacto', to: 'paginas#contacto'
  get 'reconocimientos', to: 'paginas#reconocimientos'
  get 'certificador_dashboard', to: 'paginas#certificador'
  get 'escuelas', to: 'paginas#escuelas'
  

root  'paginas#inicio'
  
end
