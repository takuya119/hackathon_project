Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # 
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # ユーザー関連
  get 'signup', to: 'users#new' # 新規登録ページのURLを分かりやすくするためにresourcesから外している
  resources :users, only: %i[create]
  resource :profile, only: %i[show edit update destroy] # ログイン後のユーザー関連を集約、current_userから必要な情報を入手するのでresource(単数形)
  resources :password_resets, only: %i[new create edit update]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # 施設関連(検索後に施設からその施設の部屋に飛ぶためのページは未設定)
  scope module: :facility do
    root 'facilities#index' # ログイン無しで使えるメイン機能なのでrootに設定
    resources :facilities, only: %i[show] do
      get 'bookmarks', on: :collection
      resources :bookmarks, only: %i[create destroy]
      resources :comments, only: %i[create show destroy]
    end
    scope 'fac' do
      resources :comments, only: %i[] do
        resources :replies, only: %i[new create destroy], as: 'fac_replies'
      end
    end
  end

  # イベント関連
  scope module: :event do
    resources :events do
      get 'mine', on: :collection
      resources :participations, only: %i[create destroy]
      resources :comments, only: %i[create destroy]
    end
    scope 'evt' do
      resources :comments, only: %i[] do
        resources :replies, only: %i[create destroy], as: 'evt_replies'
      end
    end
  end
end
