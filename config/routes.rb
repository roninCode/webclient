Rails.application.routes.draw do
  get '/employees' => 'employees#index'
  
  get '/employees/new' => 'employees#new'

  get '/employees/:id/edit' => 'employees#edit'

  get '/employees/:id' => 'employees#show'
  
  patch '/employees/:id' => 'employees#update'

  post '/employees' => 'employees#create'
  
  delete '/employees/:id' => 'employees#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
