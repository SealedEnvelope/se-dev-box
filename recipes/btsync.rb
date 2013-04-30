dmg_package "BTSync" do
  app "BitTorrent Sync"
  type "app"
  source "http://btsync.s3-website-us-east-1.amazonaws.com/BTSync.dmg"
  checksum "036cba47890ac6e40c5f2d2c2e10263ceb0e87bdb165a408c9dd86cb81b0981a"
  volumes_dir "BTSync"
  action :install
end

require "pathname"
shared_docs = Pathname(ENV["HOME"]) + "Documents/SE"
directory shared_docs.to_s do
  owner WS_USER
  group "staff"
  mode "0755"
end

directory (shared_docs + "Shared").to_s do
  owner WS_USER
  group "staff"
  mode "0755"
end
