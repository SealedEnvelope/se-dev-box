#!/usr/bin/env ruby
require 'etc'

texlive = "/usr/local/texlive"

unless File.exist?(texlive)
  warn "Basictex isn't installed!"
  abort
end

if File.stat(texlive).uid == 0
  system "sudo chown -R #{ENV["USER"]}:admin #{texlive}"
end

unless system "which -s tlmgr"
  warn "Couldn't find tlmgr"
  abort
end

["lastpage",
 "rsfs",
 "calrsfs",
 "siunitx",
 "tikz-qtree",
 "enumitem",
 "tikzmark",
 "multicol",
 "marginnote",
 "sectsty",
 "lstaddons"].each do |pkg|
  system "tlmgr info #{pkg} | egrep --quiet '^installed: +Yes' || tlmgr install #{pkg}"
end
