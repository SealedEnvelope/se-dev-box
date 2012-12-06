dmg_package "Google drive" do
  app "Google Drive"
  volumes_dir "Install Google Drive"
  dmg_name "installgoogledrive"
  source "https://dl-ssl.google.com/drive/installgoogledrive.dmg"
  checksum "79384fb8eb80c5576f1bf86e8727ce1d263d8d82e703d494ade6cdc758ebf43e"
  action :install
end
