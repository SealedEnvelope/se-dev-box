include_recipe "pivotal_workstation::bash_it"

bash_it_custom_dir = ::File.join(node["bash_it"]["dir"], "custom")
remote_file File.join(bash_it_custom_dir, "bundler-exec.bash") do
  source "https://github.com/gma/bundler-exec/raw/master/bundler-exec.sh"
  owner node[:current_user]
  mode "0755"
end
