Rails.application.routes.draw do
  resources :elements
  root to: "staticpages#home"
  devise_for :authors
  # resources :articles

  scope module: 'authors' do
    resources :articles
  end
end
