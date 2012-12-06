include_recipe "se::bash_profile-node_bin_path"

execute "install uglify-js" do
  command "npm install -g uglify-js"
  not_if "which uglifyjs"
end

execute "install jshint" do
  command "npm install -g jshint"
  not_if "which jshint"
end
