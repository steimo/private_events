Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'events#index'
  get 'users/:user_id/created_events' => 'users#created_events', as: :user_events
  get 'events/:id/attendees' => 'events#attendees', :as => :event_attendees
end
