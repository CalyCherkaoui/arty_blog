Rails.application.routes.draw do
  root to: "staticpages#home"
  devise_for :authors
  # resources :articles

  scope module: 'authors' do
    resources :articles do
      resources :elements
    end
  end
end
