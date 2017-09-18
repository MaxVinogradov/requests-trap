Rails.application.routes.draw do
  root 'welcome#index'

  match ':trap_id' => 'trap#visit', via: [:get]
  match ':trap_id/requests' => 'requests#statistic', via: [:all]

end
