include_recipe "pivotal_workstation::git"

execute "set alias st=status" do
  command "git config --global alias.st 'status -sb'"
  user WS_USER
end

execute "set alias di=diff" do
  command "git config --global alias.di diff"
  user WS_USER
end

execute "set alias co=checkout" do
  command "git config --global alias.co checkout"
  user WS_USER
end

execute "set alias ci=commit" do
  command "git config --global alias.ci commit"
  user WS_USER
end

execute "set alias br=branch" do
  command "git config --global alias.br branch"
  user WS_USER
end

execute "set alias llog=log --date=local" do
  command "git config --replace-all --global alias.llog 'log --date=local'"
  user WS_USER
end

execute "set alias logwithtags=log --decorate=full" do
  command "git config --replace-all --global alias.logwithtags 'log --decorate=full'"
  user WS_USER
end

execute "set alias lg" do
  command "git config --replace-all --global alias.lg 'log --graph --pretty=format:\"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset\" --abbrev-commit --date=relative'"
  user WS_USER
end

execute "set alias last" do
  command "git config --replace-all --global alias.last 'log -1 --pretty-format=\"%H\"'"
  user WS_USER
end

execute "set alias hist" do
  command "git config --replace-all --global alias.hist 'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'"
  user WS_USER
end

execute "set alias rm-all" do
  command "git config --replace-all --global alias.rm-all '! git ls-files --deleted | xargs git rm'"
  user WS_USER
end

execute "set apply whitespace=nowarn" do
  command "git config --global apply.whitespace nowarn"
  user WS_USER
end

execute "set color branch=auto" do
  command "git config --global color.branch auto"
  user WS_USER
end

execute "set color diff=auto" do
  command "git config --global color.diff auto"
  user WS_USER
end

execute "set color interactive=auto" do
  command "git config --global color.interactive auto"
  user WS_USER
end

execute "set color status=auto" do
  command "git config --global color.status auto"
  user WS_USER
end

execute "set color ui=auto" do
  command "git config --global color.ui auto"
  user WS_USER
end

execute "set branch autosetuprebase=always" do
  command "git config --global branch.autosetuprebase always"
  user WS_USER
end

execute "set push default=upstream" do
  command "git config --global push.default upstream"
  user WS_USER
end
