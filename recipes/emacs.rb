include_recipe "se-dev-box::bash_profile-emacs_pager"

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
