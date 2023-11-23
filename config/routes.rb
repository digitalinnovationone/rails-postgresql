Rails.application.routes.draw do
  resources :administradores
  resources :enderecos
  resources :enderecoses
  resources :fornecedor_tipos
  resources :fornecedores do
    resources :fornecedores_enderecos
  end

  get '/login', to: 'login#index'
  get '/sair', to: 'login#sair'
  post '/login', to: 'login#logar'

  root "home#index"

  get '/carros', to: 'carros#index', as: 'carros'
  get '/carros/novo', to: 'carros#novo', as: 'carros_novo'
  post '/carros', to: 'carros#criar', as: 'carros_criar'
  get '/carros/:id', to: 'carros#show', as: 'carros_show'
  put '/carros/:id', to: 'carros#alterar', as: 'carros_alterar'
  get '/carros/:id/editar', to: 'carros#editar', as: 'carros_editar'
  delete '/carros/:id', to: 'carros#apagar', as: 'carros_apagar'
end
