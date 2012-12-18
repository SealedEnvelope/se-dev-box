include_recipe "pivotal_workstation::git"

configure_git = lambda do |key, value|
  execute "git configure #{key}" do
    user user
    command "git config --global #{key} #{value}"
    not_if "[[ $(git config --global --get #{key}) = #{value} ]]"
  end
end

configure_git["user.name", '"' + node[:git][:user_name] + '"'] if node[:git][:user_name]
configure_git["user.email", node[:git][:user_email]] if node[:git][:user_email]
configure_git["user.signingkey", node[:git][:user_signingkey]] if node[:git][:user_signingkey]

configure_git["github.user", '"' + node[:github][:user] + '"'] if node[:github][:user]
configure_git["github.token", node[:github][:token]] if node[:github][:token]

configure_git["alias.st", "'status -sb'"]
configure_git["alias.di", "diff"]
configure_git["alias.co", "checkout"]
configure_git["alias.ci", "commit"]
configure_git["alias.br", "branch"]
configure_git["alias.logwithtags", "'log --decorate=full'"]
configure_git["alias.lg", "'log --graph --pretty=format:\"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset\" --abbrev-commit --date=relative'"]
configure_git["alias.lsig", "'log --show-signature'"]
configure_git["alias.last", "'log -1 --pretty=\"%H\"'"]
configure_git["alias.hist", "'log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short'"]
configure_git["alias.rm-all", "'! git ls-files --deleted | xargs git rm'"]

configure_git["color.branch", "auto"]
configure_git["color.diff", "auto"]
configure_git["color.interactive", "auto"]
configure_git["color.status", "auto"]
configure_git["color.ui", "auto"]

configure_git["apply.whitespace", "nowarn"]

configure_git["branch.autosetuprebase", "always"]
configure_git["push.default", "upstream"]

gitconfig = File.join(node[:etc][:passwd][node[:current_user]][:dir], ".gitconfig")
file gitconfig do
  owner node[:current_user]
end
