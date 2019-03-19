Rails.application.routes.draw do

  resources :avisos
  devise_for :users, path: '',path_names: {sign_in: 'ingresar', sign_out: 'salir', sign_up: 'registro'}
  resources :eventos
  resources :recursos
  resources :servicios
  resources :precios
  resources :contactos
  resources :clientes
  resources :acercades


  get 'acerca_de', to: 'paginas#acerca_de'
  get 'servicios', to: 'paginas#servicios'
  get 'socios', to: 'paginas#socios'
  get 'precios', to: 'paginas#precios'
  get 'contacto', to: 'paginas#contacto'

root  'paginas#inicio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
