#!/usr/bin/env ruby

# For example only - you'd want to use your own AMI id.
require 'rubygems'
require 'fog'

@bluebox_api_key = "CHANGEME"
@bluebox_customer_id = "CHANGEME"
@aws_access_key_id = "CHANGEME"
@aws_secret_access_key = "CHANGEME"
@my_public_key = "CHANGEME"

@flavor_id = "94fd37a7-2606-47f7-84d5-9000deda52ae" # Block 1GB Virtual Server
@image_id = "03807e08-a13d-44e4-b011-ebec7ef2c928"  # Ubuntu 10.04 x64 LTS

# Grab our current list of servers
@bbg_servers = Fog::Bluebox.new(:bluebox_api_key => @bluebox_api_key, :bluebox_customer_id => @bluebox_customer_id).servers

# Create a new server.
@server = @bbg_servers.new(:flavor_id => @flavor_id, :image_id => @image_id,
                           :ssh_key => @my_public_key)

# Save the server, triggering its creation
@server.save