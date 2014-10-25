unless ::File.exists?("/Library/Fonts/Inconsolata.otf")
  remote_file "#{Chef::Config[:file_cache_path]}/Inconsolata.otf" do
    source 'http://levien.com/type/myfonts/Inconsolata.otf'
    checksum '7f0a4919d91edcef0af9dc153054ec49d1ab3072'
  end
  execute "copy Inconsolata Font" do
    command "cp #{Chef::Config[:file_cache_path]}/Inconsolata.otf /Library/Fonts/"
    not_if { File.exists?("/Library/Fonts/Inconsolata.otf") }
  end
end
