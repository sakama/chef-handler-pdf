# -*- coding: utf-8 -*-
#
# Cookbook Name:: chef-handler-pdf
# Recipe:: default
#
# Copyright 2013, Satoshi Akama
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef_handler'

handler_path = node['chef_handler']['handler_path']

cookbook_file "#{handler_path}/chef_handler_pdf.rb" do
  action :nothing
end.run_action(:create)

chef_handler "Chef::Handler::Pdf" do
  source "#{handler_path}/chef_handler_pdf" 
end.run_action(:enable)
