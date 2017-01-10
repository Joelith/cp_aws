Rails.application.routes.draw do
  mount CpAws::Engine => "/cp_aws"
end
