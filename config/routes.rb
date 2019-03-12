Rails.application.routes.draw do
  resources :eventos
  resources :noticia
  resources :servicios
  resources :precios
  resources :contactos
  resources :clientes
  resources :acercades
  get 'paginas/inicio'
  get 'paginas/acerca_de'
  get 'paginas/servicios'
  get 'paginas/clientes'
  get 'paginas/precios'
  get 'paginas/contacto'

root 'paginas#inicio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
