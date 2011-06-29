Refinery::Application.routes.draw do
  get '/qa', :to => 'questions#new', :as => 'new_question'
  resources :qa,
            :only => :create,
            :as => :questions,
            :controller => 'questions' do
    collection do
      get :thank_you
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :questions, :only => [:index, :show, :destroy] do
      collection do
        get :spam
      end
      member do
        get :toggle_spam
      end
    end
    resources :question_settings, :only => [:edit, :update]
  end
end
