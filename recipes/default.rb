#
# Cookbook Name:: chef-handler-pdf
# Recipe:: default
#
# Copyright 2013, Satoshi Akama
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

include_recipe 'chef_handler'
handler_path = node['chef_handler']['handler_path']
pdf_templates_path = "#{handler_path}/pdf_templates"

# PDF出力のためのthinreports gemのインストール
# globalな空間を汚したくないので/opt/chef/以下に入れる
# http://www.thinreports.org/
chef_gem "thinreports" do
  action :install
end

# chef_handler_pdfをファイルとしてhandler_pathに出力
cookbook_file "#{handler_path}/chef_handler_pdf.rb" do
  action :nothing
end.run_action(:create)

# PDFテンプレートディレクトリ作成
directory "#{pdf_templates_path}" do
  if node["platform"] != "windows"
    owner node['chef_handler']['root_user']
    group node['chef_handler']['root_group']
    mode "0755"
    recursive true
    action :create
  end
end

# PDFテンプレートをサーバ上に配置
node['chef-handler-pdf']['templates'].each do |template|
  cookbook_file "#{pdf_templates_path}/#{template}" do
    source "templates/#{template}"
    mode "0644"
  end
end

# PDF出力処理
chef_handler "Chef::Handler::Pdf" do
  source "#{handler_path}/chef_handler_pdf" 
end.run_action(:enable)
