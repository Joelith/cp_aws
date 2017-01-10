module CpAws
  class Ec2Instance < CloudInstance
  	include CpAws::Ec2Mixin

  	def to_s
  		init_config['tags']['name'].nil? ? name : init_config['tags']['name']
  	end

  	def provider
  		"AWS"
  	end

  	def cloud_type
			"EC2"
		end

		def icon
			"fa-desktop"
		end

  	def calc_cost(start_date, end_date)
  		cost = 0
			cost = (end_date - start_date) * (month_cost / 30)
			cost
  	end

  	def month_cost
  		cost = calculate_monthly_cost(init_config)
  		cost
  	end

  	def _provision
			@server = connection.servers.create(init_config)
			self.update(name: @server.id)
		end

		def fog
			@server ||= connection.servers.get(name)
			@server
		end

		def attr_get(attribute)
			begin
				fog.attributes[attribute.to_sym]
			rescue Fog::Compute::AWS::NotFound
				"Error"
			end
		end

		def wait
			fog.wait_for { ready? }
		end

		def connection 
	 		@connection ||= Fog::Compute.new :provider => 'AWS', :region => CpAws.region, :aws_access_key_id => CpAws.aws_access_key_id, :aws_secret_access_key => CpAws.aws_secret_access_key
		end
  end
end