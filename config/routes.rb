MyApiApp::Application.routes.draw do
  resources :users, except: [:new, :edit], shallow: true do
    resources :books, except: [:new, :edit]
  end
end
