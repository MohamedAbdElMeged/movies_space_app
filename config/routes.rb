Rails.application.routes.draw do
  resources :movies do 
    resources :reviews
  end
  post "/import", to: "imports#import"
  root "movies#index"
end
