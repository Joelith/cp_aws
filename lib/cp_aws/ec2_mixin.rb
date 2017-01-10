module CpAws
	module Ec2Mixin
		def calculate_monthly_cost(override=nil)
			if override.nil? then override = config end

  		#type = !override['flavor_id'].nil? ? override['flavor_id'] : (flavor_id || fog.flavor_id)
  		if override['flavor_id'] then type = override['flavor_id']
  		elsif defined? flavor_id and !flavor_id.nil? then type = flavor_id
  		elsif defined? fog and !fog.nil? then type = fog.flavor_id
  		else type = 't1.micro' end
  		puts "Type: #{type}"

  		case CpAws.region
  		when 'us-west-2'
  			case type
  			when 't1.micro'
  				rate = 0.02
  			when 'm1.large'
  				rate = 0.175
  			else
  				rate = 0
  			end
  		end
  		rate * 24 * 30
		end
	end
end
