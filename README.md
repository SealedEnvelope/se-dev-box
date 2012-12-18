Description
===========

Chef recipes for use with https://github.com/pivotal/pivotal_workstation / https://github.com/mkocher/soloist on Mountain Lion.

Requirements
============

- Mountain Lion.
- [Xcode command line tools](https://developer.apple.com/downloads/index.action) (or full Xcode install - untested).

If using Xcode command line tools, replace `/usr/bin/xcrun` with:

    #!/bin/bash
    $@
    exit 0

and cross fingers.

Attributes
==========

- `node['git']['user_name']` - User name for .gitconfig
- `node['git']['user_email']` - User email for .gitconfig
- `node['git']['user_signingkey']` - GPG key ID for .gitconfig
- `node['github']['user']` - Github user name for .gitconfig
- `node['github']['token']` - Github token for .gitconfig
- `node['pandoc']['version']` - Pandoc version to install
- `node['pandoc']['checksum']` - Checksum for Pandoc version

Usage
=====

    $ bash < <(curl -s https://raw.github.com/SealedEnvelope/se-dev-box/master/generate_soloistrc.sh)

This will create a `~/cookbooks/soloistrc` file listing the recipes that will be installed. Review the list of recipes, set or remove attributes as appropriate, then:

    $ ruby < <(curl -s https://raw.github.com/SealedEnvelope/se-dev-box/master/installer)

This installs the [soloist](https://github.com/mkocher/soloist) gem, clones

 * https://github.com/pivotal/pivotal_workstation.git
 * https://github.com/opscode-cookbooks/dmg.git
 * https://github.com/SealedEnvelope/se-dev-box.git

into `~/cookbooks`, and runs `soloist` against `~/cookbooks/soloistrc`.
