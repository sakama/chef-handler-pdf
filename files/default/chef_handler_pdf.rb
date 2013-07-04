# -*- coding: utf-8 -*-
#
# Cookbook Name:: chef-handler-pdf
# Recipe:: default
#
# Copyright 2013 Satoshi Akama
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'thinreports'

class Pdf < Chef::Handler

  def report
    Chef::Log.info "Resources updated this run:"
    #run_status.updated_resources.each {|r| Chef::Log.info "  #{r.to_s}"}
    #run_status.node.each {|r| Chef::Log.info "  #{r.to_s}"}
    run_status.run_context.cookbook_collection.each {|r| Chef::Log.info "  #{r.to_s}"}
    #run_status.all_resources.each {|r| Chef::Log.info "  #{r.to_s}"}
  end

  def create_pdf
    
  end
end
