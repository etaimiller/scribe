Rails.application.routes.draw do

  resources :audio_files, only: [:index, :new, :create, :update]
end
