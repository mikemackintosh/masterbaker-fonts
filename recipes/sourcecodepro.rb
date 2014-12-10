unless ::File.exists?("/Library/Fonts/SourceCodePro-Regular.ttf")
  remote_file "#{Chef::Config[:file_cache_path]}/SourceCodePro_FontsOnly-1.017.zip" do
    source 'http://tcpdiag.dl.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip'
    checksum '8136b4686309c428ef073356ab178c2f7e8f7b6fadd5a6c61b6a20646377b21f'
  end

  execute "unzip SourceCodePro Font" do
    command "unzip #{Chef::Config[:file_cache_path]}/SourceCodePro_FontsOnly-1.017.zip"
    cwd Chef::Config[:file_cache_path]
    not_if { File.exists?("#{Chef::Config[:file_cache_path]}/SourceCodePro_FontsOnly-1.017/") }
  end

  execute "copy SourceCodePro Font" do
    command "cp #{Chef::Config[:file_cache_path]}/SourceCodePro_FontsOnly-1.017/TTF/*.ttf /Library/Fonts/"
    not_if { File.exists?("/Library/Fonts/SourceCodePro-Regular.ttf") }
  end
end
