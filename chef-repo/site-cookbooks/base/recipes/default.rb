#
# Cookbook Name:: base
# Recipe:: default
#

service 'iptables' do
  action [:disable, :stop]
end

plenv_install "5.18.1" do
  user   "vagrant"
  action :install
end

plenv_global "5.18.1" do
  user   "vagrant"
  action :run
end

%w[
  Plack
  Mojolicious
].each do |mod|
  plenv_cpanm mod do
    user    "vagrant"
    version "5.18.1"
#    options "--force"
    action  :install
  end
end
