Rails.application.routes.draw do
  root to: "staticpages#home"
  devise_for :authors
  resources :articles
  
end
