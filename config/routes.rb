AgilefamilyAlpha::Application.routes.draw do
  devise_for :family_members, :path => "accounts"
  # match '/foo', :to => redirect('/foo.html')
  # root :to => "families#index"
  resources :families
  resources :tasks
  resources :family_members
end
