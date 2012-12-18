execute "source .bash_profile from .bashrc" do
  command "echo 'source #{ENV["HOME"]}/.bash_profile' >> #{ENV["HOME"]}/.bashrc"
  not_if "grep 'source .*.bash_profile' #{ENV["HOME"]}/.bashrc"
end
