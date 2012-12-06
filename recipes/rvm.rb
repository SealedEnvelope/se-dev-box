brew_install "automake"
brew_install "libksba"
brew_install "readline"

include_recipe "pivotal_workstation::java"
include_recipe "pivotal_workstation::git"

rvm_git_revision_hash  = version_string_for("rvm")

::RVM_HOME = "#{WS_HOME}/.rvm"
::RVM_COMMAND = "#{::RVM_HOME}/bin/rvm"

pivotal_workstation_bash_profile_include "rvm"

run_unless_marker_file_exists(marker_version_string_for("rvm")) do
  recursive_directories [RVM_HOME, 'src', 'rvm'] do
    owner WS_USER
    recursive true
  end

  [
    "curl -Lsf http://github.com/wayneeseguin/rvm/tarball/#{rvm_git_revision_hash} | tar xvz -C#{RVM_HOME}/src/rvm --strip 1",
    "cd #{RVM_HOME}/src/rvm; ./install",
    "#{RVM_COMMAND} --version | grep Wayne"
  ].each do |rvm_cmd|
    execute rvm_cmd do
      user WS_USER
    end
  end

  %w{readline autoconf openssl zlib}.each do |rvm_pkg|
    execute "install rvm pkg: #{rvm_pkg}" do
      command "#{::RVM_COMMAND} pkg install #{rvm_pkg}"
      user WS_USER
    end
  end
end

ruby_version = "ruby-1.9.3-p194"
readline_dir = %x{brew info readline | grep Cellar | cut -f1 -d' '}
execute "clean out the archive and src directories each time.  bad downloads cause problems with rvm" do
  only_if params[:only_if] if params[:only_if]
  not_if params[:not_if] || "test -e #{::RVM_HOME}/bin/#{ruby_version}"
  command "rm -rf #{::RVM_HOME}/archives/*#{ruby_version}* #{::RVM_HOME}/src/*#{ruby_version}*"
  user params[:user] || WS_USER
end

install_cmd = "#{RVM_COMMAND} install #{ruby_version} --with-readline-dir=#{readline_dir}"
#| (! grep 'error') : if we see rvm errors in stderr, fail
#this is due to an rvm bug (we've notified the author).  as soon as curl error cause rvm to exit nonzero,
#we can get rid of this
install_cmd << " 2>&1 | (! grep error | grep -v \"clang: error: unsupported option '--with-libyaml'\")"

execute "installing #{ruby_version} with RVM: #{install_cmd}" do
  only_if params[:only_if] if params[:only_if]
  not_if params[:not_if] || "test -e #{::RVM_HOME}/bin/#{ruby_version}"
  command install_cmd
  user params[:user] || WS_USER
end

execute "making #{ruby_version} with rvm the default" do
  command "#{::RVM_COMMAND} alias create default #{ruby_version}"
  user WS_USER
end
