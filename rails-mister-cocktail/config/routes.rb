Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do 
    resources :doses, only: [:new, :create]
  end 
  delete 'doses/:id', to: 'doses#destroy', as: 'doses' 
end
