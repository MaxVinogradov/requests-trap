Rails.application.routes.draw do
  resource :trap_id
  root 'welcome#index'

  match ':trap_id' => 'trap#visit', via: [:all]
  match ':trap_id/requests' => 'requests#statistic', via: [:all]

end
