pivotal_workstation_bash_it_custom_plugin "npm_bin_path.bash"

execute "install uglify-js" do
  command "npm install -g uglify-js"
  not_if "which uglifyjs"
end

execute "install jshint" do
  command "npm install -g jshint"
  not_if "which jshint"
end
