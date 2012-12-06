remote_file File.join(node["bash_includes_subdir"], "bundler-exec.sh") do
  source "https://github.com/gma/bundler-exec/raw/master/bundler-exec.sh"
  owner WS_USER
  mode "0755"
end
