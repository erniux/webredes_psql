Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :escuelas
  resources :certificadors
  
  resources :cert_escolars do
    delete :delete_upload_attachment
    delete :delete_upload_revisiones
  end

  #resources :media_contents, only: [:create]
  #delete 'delete_media', to: "media_contents#delete_media"
  #delete 'delete_all', to: 'media_contents#delete_all'
  
  resources :procesos
  resources :acercade_certificates
  resources :preguntas_certs
  resources :estandar_etapa_certificacions do
    delete :delete_obligatorio 
    delete :delete_apoyo
  end  
  resources :etapa_certificacions
  resources :reconocimiento_redes
  resources :avisos 
  resources :events
  resources :recursos
  resources :precios
  resources :acercades
  resources :contactos, only: [:create, :new]
  resources :audit_logs, except: [:new, :edit, :destroy]
    
  devise_for :users, path: '',path_names: {sign_in: 'ingresar', sign_out: 'salir', sign_up: 'registro'}

  get "paginas/contacto"
  get "paginas/chat"

  get 'escuela_dashboard', to: 'cert_escolars#show_escuela'
  get 'acerca_de', to: 'paginas#acerca_de'
  get 'socios', to: 'paginas#socios'
  get 'precios', to: 'paginas#precios'
  get 'contacto', to: 'paginas#contacto'
  get 'reconocimientos', to: 'paginas#reconocimientos'
  get 'certificador_dashboard', to: 'paginas#certificador'
  get 'escuelas', to: 'paginas#escuelas'
  get 'chat', to: 'paginas#chat'

  post "contactos/new"
  
  root  'paginas#reconocimientos' 
  
end
