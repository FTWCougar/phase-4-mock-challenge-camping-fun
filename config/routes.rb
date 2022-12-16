Rails.application.routes.draw do
    resources :campers, only: %i[index show create]
    resources :activities, only: %i[index destroy]
    resources :signups, only: [:create]
end
