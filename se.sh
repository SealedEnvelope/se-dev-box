#!/usr/bin/env bash
# SE specific configuration

mkdir -p ~/dev/SE
ln -sfh ~/dev/SE ~/SE

warn() {
  echo "$1" >&2
}

check_rackspace_auth() {
  local chef_dir="$HOME/SE/se_chef"
  local rackspace_auth="$chef_dir/.chef/rackspace.authentication.json"
  if [[ -d "$chef_dir" && ! -e "$rackspace_auth" ]] ; then
    warn "You need to create $rackspace_auth"
    warn "It should contain the authentication details found on the API keys page"
    warn "of the mycloud.rackspace.co.uk site:"
    warn "  {\"username\":\"username here\",\"api_key\":\"api key here\"}"
    warn "It should be chmod'ed to 0600."
  fi
}
check_rackspace_auth

# append homebrew bash to list of shells and specify as user shell
bash=/usr/local/bin/bash
grep -q $bash /etc/shells || sudo sh -c "echo $bash >> /etc/shells"
chsh -s $bash
