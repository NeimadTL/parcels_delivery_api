Rails.application.routes.draw do
  get  '/transporters', to: 'transporter_companies#index'
  post '/transporters', to: 'transporter_companies#create'
  get  '/transporters/:id/carriers', to: 'carriers#index'
  put  '/carrier/:id/trackings', to: 'carriers#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
