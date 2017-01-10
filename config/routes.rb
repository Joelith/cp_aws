Rails.application.routes.draw do
	namespace :cp_aws do
		get 'admin' => 'admin#dashboard'
		resources :ec2_instances, type: 'CpAws::Ec2Instance'
	end

	resources :products do
		namespace :cp_aws do
			resources :ec2_components, type: 'CpAws::Ec2Component'
		end
	end
end
