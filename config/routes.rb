Rails.application.routes.draw do

  namespace :ember do
    namespace :ticket do
      resources :extensions,        only: [:index, :show, :create, :update, :destroy] do
        member do
          post :close
          post :decline
        end
      end
      resources :freezings,         only: [:index, :show, :create, :update, :destroy] do
        member do
          post :close
          post :decline
        end
      end
      resources :guest_visits,      only: [:index, :show, :create, :update, :destroy] do
        member do
          post :close
        end
      end
      resources :recalls,           only: [:index, :show, :create, :update, :destroy] do
        member do
          post :close
        end
      end
      resources :messages,          only: [:index, :show, :create, :update, :destroy] do
        member do
          post :close
        end
      end
      resources :tutoring_requests, only: [:index, :show, :create, :update, :destroy] do
        member do
          post :close
          post :decline
        end
      end
      resources :workout_requests,  only: [:index, :show, :create, :update, :destroy] do
        member do
          post :close
          post :decline
        end
      end
    end
    resources :users,               only: [:index, :show, :create, :update, :destroy] do
      collection do
        post 'authenticate'
      end
    end

    namespace :card do
      resources :templates
    end

    namespace :club do
      resources :shedules
      resources :images
    end
    namespace :coach do
      resources :achievements
      resources :specializations
      resources :educations
    end

    resources :schedule_templates
    resources :permissions, only: :show
    resources :qrs
    resources :coaches
    resources :training_packages
    resources :franchises
    resources :clubs
    resources :score_rules
    resources :cards
    resources :news
    resources :user_types
    resources :roles, only: [:index, :show]
    namespace :qr do
      resources :templates
    end
    namespace :reward do
      resources :templates
    end
    namespace :workout do
      resources :images
      resources :types
      resources :templates
    end
    resources :workouts
    resources :schedule_workouts

    namespace :history do
      resources :rewards
    end
  end

  namespace :mobile do
    namespace :ticket do
      resources :extensions,        only: [:index, :show, :create]
      resources :freezings,         only: [:index, :show, :create]
      resources :messages,          only: [:index, :show, :create]
      resources :recalls,           only: [:index, :show, :create]
      resources :guest_visits,      only: [:index, :show, :create]
      resources :tutoring_requests, only: [:index, :show, :create, :destroy]
      resources :workout_requests,  only: [:index, :show, :create, :destroy]
    end
    namespace :reward do
      resources :templates, only: [:index, :show]
    end
    resources :cards,      only: [:index, :show] do
      member do
        post 'break_frost'
        post 'add_social_score'
      end
    end
    resources :clubs,       only: [:index, :show]
    resources :coaches,     only: [:index, :show]
    resources :franchises,  only: [:index, :show]
    resources :news,        only: [:index, :show]
    resources :push_topics, only: [:index, :show]
    resources :qrs,         only: [:index, :show] do
      member do
        post 'charge'
      end
    end
    resources :rewards,    only: [:show] do
      member do
        post 'reserve'
      end
    end
    resources :tutorings,  only: [:index, :show, :destroy]
    resources :users,      only: [:index, :show] do
      collection do
        post 'send_password_via_sms'
        post 'authenticate'
        post 'generate_guest'
      end
    end
    resources :workouts,   only: [:index, :show] do
      member do
        post :add_me
        post :remove_me
      end
    end
  end

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
