module CpAws
  class Ec2ComponentsController < CloudComponentsController
  	def component_params
		  params.require(:cp_aws_ec2_component).permit(:name, :flavor_id, :availability_zone, :tenancy, :placement_group)
		end
  end
end
