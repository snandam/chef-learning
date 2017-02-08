package 'install apache' do
  package_name 'httpd'
  action :install
end

service 'httpd' do
  action [:enable, :start]
end

