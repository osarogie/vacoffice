Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
 	# resources :orders
  
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphqlPlaygroundRails::Engine, at: '/graphql/playground', graphql_path: '/graphql'
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
