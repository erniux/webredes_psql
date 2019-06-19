Rails.application.routes.draw do

  resources :escuelas
  resources :certificadors
  namespace :admin do
      resources :users
      resources :acercades
      resources :acercade_certificates
      resources :avisos
      resources :cert_escolars
      resources :contactos
      resources :estandar_etapa_certificacions
      resources :etapa_certificacions
      resources :eventos
      resources :precios
      resources :preguntas_certs
      resources :reconocimiento_redes
      resources :recursos
      resources :admin_users
  
      root to: "users#index"
    end
  resources :cert_escolars
  resources :acercade_certificates
  resources :preguntas_certs
  resources :estandar_etapa_certificacions
  resources :etapa_certificacions
  resources :reconocimiento_redes
   
    
  devise_for :users, path: '',path_names: {sign_in: 'ingresar', sign_out: 'salir', sign_up: 'registro'}

  resources :avisos 
  resources :eventos
  resources :recursos
  resources :precios
  resources :acercades

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
