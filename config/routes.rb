InventoryApp2::Application.routes.draw do


  resources :bundle_attributes


  resources :item_features


  resources :user_comments


  resources :assignment_histories


  root to: 'static_pages#welcome'

  match 'checkouts/assign-serial-number' => 'checkouts#assign_serial_number',     as: 'serial_assignment'

  match 'about' => 'static_pages#about'

  resources :checkouts do
    resources :comments
  end
  resources :items do
    resources :comments
  end
  resources :asset_histories
  resources :serial_numbers
  
  resources :bundles do
    resources :comments
  end
  resources :users do
    resources :comments
  end
end
