unless ::File.exists?("/Library/Fonts/Ubuntu-R.ttf")
  remote_file "#{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80.zip" do
    source 'http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip'
    checksum '88276ba9d38d75b33a9640efa15cd80979cb21e2'
  end

  execute "unzip Ubuntu Font" do
    command "unzip #{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80.zip"
    not_if { File.directory?("#{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80/") }
  end

  execute "copy Ubuntu Font" do
    command "cp #{Chef::Config[:file_cache_path]}/ubuntu-font-family-0.80/*.ttf /Library/Fonts/"
    not_if { File.exists?("/Library/Fonts/Ubuntu-R.ttf") }
  end
end
