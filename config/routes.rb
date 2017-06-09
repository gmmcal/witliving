Rails.application.routes.draw do
  resources :users do
    resources :products
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
