Description
===========

Chef recipes for use with https://github.com/pivotal/pivotal_workstation / https://github.com/mkocher/soloist on Mountain Lion.

Requirements
============

- Mountain Lion.
- [Xcode command line tools](https://developer.apple.com/downloads/index.action).

Replace /usr/bin/xcrun with:

    #!/bin/bash
    $@
    exit 0

Attributes
==========

- `node['pandoc']['version']` - Pandoc version to install
- `node['pandoc']['checksum']` - Checksum for Pandoc version

Usage
=====

Run `solowizard.sh`.
