Rails.application.routes.draw do

  resources :audio_files, only: [:new, :create, :edit, :update]
end
