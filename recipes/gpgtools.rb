dmg_package "GPGTools" do
  app "GPGTools"
  type "mpkg"
  source "https://github.com/downloads/GPGTools/GPGTools/GPGTools-20120318.dmg"
  checksum "d56abef0fca9a7910f765907fe75a309167498d6e36f930d8224e05b2f900a84"
  action :install
  not_if { File.exists?("/usr/local/MacGPG2/") }
end

execute "your current user owns ~/.gnupg" do
  command "chown -R #{node[:current_user]} #{ENV["HOME"]}/.gnupg"
  only_if { File.exists?("#{ENV["HOME"]}/.gnupg") }
end
