unless ::File.exists?("/Library/Fonts/Ubuntu-R.ttf")
  remote_file "#{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80.zip" do
    source 'http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip'
    checksum '107170099bbc3beae8602b97a5c423525d363106c3c24f787d43e09811298e4c'
  end

  execute "unzip Ubuntu Font" do
    command "unzip #{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80.zip"
    cwd Chef::Config[:file_cache_path]
    not_if { File.exists?("#{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80/") }
  end

  execute "copy Ubuntu Font" do
    command "cp #{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80/*.ttf /Library/Fonts/"
    not_if { File.exists?("/Library/Fonts/Ubuntu-R.ttf") }
  end
end
