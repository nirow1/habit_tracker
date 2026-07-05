Rails.application.routes.draw do
  get 'goals/show'
  get 'goals/new'
  get 'goals/edit'
  get 'habits/index'
  get 'habits/show'
  get 'habits/new'
  get 'habits/edit'
  root "habits#index"

  resources :habits do
    resources :goals do
      resources :check_ins, only: [:create]
    end
  end
end
