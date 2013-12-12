AgilefamilyAlpha::Application.routes.draw do
  devise_for :family_members

  root :to => "pages#index"
  resources :families
  resources :tasks

end
