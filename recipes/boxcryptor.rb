dmg_package "BoxCryptor" do
  app "Install BoxCryptor"
  type "pkg"
  source "https://www.boxcryptor.com/download/BoxCryptor_Installer.dmg"
  checksum "f501791c951418cc772db22b7af431cac616cfbf66a43fa4f1b1f9d1e735c242"
  volumes_dir "BoxCryptor Installer"
  action :install
end
