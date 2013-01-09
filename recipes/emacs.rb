pivotal_workstation_bash_it_custom_plugin "emacs.bash"

# don't want these loaded automatically by bash_it, only if in emacs
bash_it_custom_dir = ::File.join(node["bash_it"]["dir"], "custom")
template ::File.expand_path("emacs_shell_prompt.sh", bash_it_custom_dir) do
  source "emacs_shell_prompt.sh"
  owner node[:current_user]
  only_if { ::File.directory?(bash_it_custom_dir) }
end

dmg_package "Emacs" do
  app "Emacs"
  dmg_name "Emacs-24.2-universal-10.6.8"
  source "http://bandwidth.porkrind.org/emacs-builds/Emacs-24.2-universal-10.6.8.dmg"
  checksum "477bc9e180eabb2bc126e46227c3d063b222888505d398e175c0fae5777a7bd6"
  action :install
end

execute "move osx /usr/bin/emacs out of the way" do
 command "mv /usr/bin/emacs /usr/bin/emacs.original"
 not_if "[ -f /usr/bin/emacs.original ]"
end

link "/usr/bin/emacs" do
 to "/Applications/Emacs.app/Contents/MacOS/Emacs"
end
