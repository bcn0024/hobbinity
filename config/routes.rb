Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users, only: [:index, :show, :edit]
  resources :categories, only: [:index, :show, :new] do
    resources :groups, only: [ :new, :create, :show, :edit] do
      resources :messages, only: [ :create]
    end
  end
end




# 現在、ツイートの一覧画面には全ユーザーのツイートが表示されています。そこで、一覧画面とは別に、現在ログイン中のユーザーの投稿のみが表示されているマイページを作成
# <%= link_to "マイページ", "/users/#{current_user.id}" %>
# <%# マイページへのリンクは、/users/:idと指定します。:idの部分には表示したいユーザーのレコードのidを入れる必要がありますが、今回はマイページ、つまりログイン中のユーザーのページなので、current_user.idとすればOK %>