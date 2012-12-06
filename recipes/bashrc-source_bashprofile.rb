execute "source .bash_profile from .bashrc" do
  command "echo 'source #{WS_HOME}/.bash_profile' >> #{WS_HOME}/.bashrc"
  not_if "grep 'source .*.bash_profile' #{WS_HOME}/.bashrc"
end
