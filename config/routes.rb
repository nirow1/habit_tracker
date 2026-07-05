root "habits#index"

resources :habits do
  resources :goals do
    resources :check_ins, only: [:create]
  end
end
