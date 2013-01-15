r_path = "#{Chef::Config[:file_cache_path]}/R-#{node["r"]["version"]}.pkg"
remote_file r_path do
  source "#{node["r"]["cran_mirror"]}/bin/macosx/R-#{node["r"]["version"]}.pkg"
  checksum node["r"]["checksum"]
end
execute "install R" do
  command "sudo installer -pkg '/#{r_path}' -target /"
  not_if { File.exists?("/Applications/R.app") }
end
