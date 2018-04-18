Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sums1' => "sums1#index"
  #url/sums1 calls sums1 controller with index method
  post 'sums' => "sums1#create"
  post 'sums1' => "lin_regression#create"
  post 'filters' => "filters#create"
  post 'intervals' => "intervals#create"
  post 'lin_regressions' => "lin_regression#create"
end
