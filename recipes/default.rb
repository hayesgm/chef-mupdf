
bash "install_mupdf" do
  not_if "/usr/local/bin/mudraw --version | grep -q '#{node[:program][:version]}'"
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget https://mupdf.googlecode.com/files/mupdf-#{node[:program][:version]}-source.tar.gz -O /tmp/mupdf-#{node[:program][:version]}.tar.gz
    tar -zxf mupdf-#{node[:program][:version]}.tar.gz
    (cd mupdf-#{node[:program][:version]}/ && ./configure && make && make install)
  EOH
end
