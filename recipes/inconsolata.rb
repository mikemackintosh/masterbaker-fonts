unless ::File.exists?("/Library/Fonts/Inconsolata.otf")
  remote_file "#{Chef::Config[:file_cache_path]}/Inconsolata.otf" do
    source 'http://levien.com/type/myfonts/Inconsolata.otf'
    checksum '1561e616c414a1b82d6e6dfbd18e5726fd65028913ade191e5fa38b6ec375a1a'
  end
  execute "copy Inconsolata Font" do
    command "cp #{Chef::Config[:file_cache_path]}/Inconsolata.otf /Library/Fonts/"
    not_if { File.exists?("/Library/Fonts/Inconsolata.otf") }
  end
end
