AgilefamilyAlpha::Application.routes.draw do
  devise_for :family_members, :path => "accounts"

  root :to => "families#index"
  resources :families
  resources :tasks
  resources :family_members
end
