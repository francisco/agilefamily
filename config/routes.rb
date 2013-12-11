AgilefamilyAlpha::Application.routes.draw do
  devise_for :family_members

  root :to => "families#index"
  resources :families
  resources :tasks

end
