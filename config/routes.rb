Rails.application.routes.draw do
  get  '/transporters', to: 'transporter_companies#index'
  post '/transporters', to: 'transporter_companies#create'
  get  '/transporters/:id/carriers', to: 'carriers#index'
  get  '/transporters/by_postal_codes', to: 'stats#transporters_by_postcodes'
  put  '/carrier/:id/trackings', to: 'carriers#update'
  get  '/carriers/passed_by/:latitude/:longitude/', to: 'stats#carriers_passed_by',
        constraints: { latitude: /\d+\.\d+/, longitude: /\d+\.\d+/ }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
