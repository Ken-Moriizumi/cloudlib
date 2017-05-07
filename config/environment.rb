# Load the Rails application.
require_relative 'application'
require 'amazon_api'
include AmazonApi

# Initialize the Rails application.
Rails.application.initialize!
