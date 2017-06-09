Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index] do
    resources :products, only: [:index, :show] do
      member do
        post :add, to: 'products#add'
        delete :remove, to: 'products#delete'
      end
    end
    member do
      get :cart, to: 'cart#index'
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
