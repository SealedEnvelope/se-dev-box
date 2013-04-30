require "pathname"
home = Pathname(ENV["HOME"])

dev_base = home + "dev"
directory dev_base.to_s do
  owner WS_USER
  group "staff"
  mode "0755"
end

directory (dev_base + "SE").to_s do
  owner WS_USER
  group "staff"
  mode "0755"
end

link (home + "SE").to_s do
  to (dev_base + "SE").to_s
end
