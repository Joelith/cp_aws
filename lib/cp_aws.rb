require "cp_aws/engine"

module CpAws
	extend ActiveSupport::Autoload

	mattr_accessor :aws_access_key_id
  mattr_accessor :aws_secret_access_key
  mattr_accessor :region
  mattr_accessor :active_components
  mattr_accessor :rate_card

  autoload :Ec2Mixin

	def self.setup
    yield self
  end

  def self.to_s
    "AWS"
  end 
end
