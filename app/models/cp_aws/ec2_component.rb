module CpAws
  class Ec2Component < CloudComponent
  	include CpAws::Ec2Mixin

  	store :config, accessors: [:tags, :flavor_id, :availability_zone, :tenancy, :placement_group], coder: JSON

  	enum tenancy: [:default, :dedicated, :host] 

    validates :name, :presence => true

  	def name
  		self.tags['name'] unless self.tags.nil?
  	end

  	def name= value
  		self.tags = {} unless !self.tags.nil?
			self.tags['name'] = value
  	end

  	def pretty_type
      'Amazon EC2 Instance'
    end

   	def instance_name
   		if !name.nil? then name end
    end

    def instance_type
      "CpAws::Ec2Instance"
    end

    def flavors 
    	connection.flavors
    end

    def regions
    	{
    		'US East (N.Virignia)': 'us-east-1', 
    		'US East (Ohio)': 'us-east-2',
    		'US West (N. California)': 'us-west-1',
    		'US West (Oregon)': 'us-west-2',
    		'Asia Pacific (Mumbai)': 'ap-south-1',
    		'Asia Pacific (Seoul)': 'ap-northeast-2',
    		'Asia Pacific (Singapore)': 'ap-southeast-1',
    		'Asia Pacific (Sydney)': 'ap-southeast-2',
    		'Asia Pacific (Tokyo)': 'ap-northeast-1',
    		'Canada (Central)': 'ca-central-1',
    		'China (Beijing)': 'cn-north-1',
    		'EU (Frankfurt)': 'eu-central-1',
    		'EU (Ireland)': 'eu-west-1',
    		'EU (London)': 'eu-west-2',
    		'South America (Sao Paulo)': 'sa-east-1',
    		'AWS GovCloud (US)': 'us-gov-west-1'
    	}
    end

    def connection 
	 		@connection ||= Fog::Compute.new :provider => 'AWS', :region => CpAws.region, :aws_access_key_id => CpAws.aws_access_key_id, :aws_secret_access_key => CpAws.aws_secret_access_key
		end
  end
end
