basictex_path = "/#{Chef::Config[:file_cache_path]}/mactex-basic.pkg"
remote_file basictex_path do
  source "http://mirror.ctan.org/systems/mac/mactex/mactex-basic.pkg"
  checksum "8ae51339d6c0abe2af6a99aa1a7fc48459d5a3e2661f6b2c43c3a60520e054e2"
end
execute "install BasicTeX" do
  command "sudo installer -pkg '/#{basictex_path}' -target /"
end

dmg_package "pandoc-#{node[:pandoc][:version]}" do
  source "http://pandoc.googlecode.com/files/pandoc-1.9.4.2.dmg"
  type "pkg"
  dmg_name "pandoc-#{node[:pandoc][:version]}"
  volumes_dir "pandoc #{node[:pandoc][:version]}"
  checksum node[:pandoc][:checksum]
  action :install
end
