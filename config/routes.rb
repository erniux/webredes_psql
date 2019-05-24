Rails.application.routes.draw do

  resources :preguntas_certs
  resources :estandar_etapa_certificacions
  resources :etapa_certificacions
  resources :reconocimiento_redes
  namespace :admin do
      resources :users
      resources :acercades
      resources :avisos
      resources :eventos
      resources :precios
      resources :recursos
      resources :servicios
      resources :admin_users

      root to: "users#index"
    end
  namespace :admin do
      resources :users
      resources :acercades
      resources :avisos
      resources :eventos
      resources :precios
      resources :recursos
      resources :servicios

      root to: "users#index"
    end
    
  devise_for :users, path: '',path_names: {sign_in: 'ingresar', sign_out: 'salir', sign_up: 'registro'}

  resources :avisos 
  resources :eventos
  resources :recursos
  resources :servicios
  resources :precios
  resources :acercades

  

  get 'acerca_de', to: 'paginas#acerca_de'
  get 'servicios', to: 'paginas#servicios'
  get 'socios', to: 'paginas#socios'
  get 'precios', to: 'paginas#precios'
  get 'contacto', to: 'paginas#contacto'
  get 'reconocimientos', to: 'paginas#reconocimientos'

root  'paginas#inicio'
  
end
