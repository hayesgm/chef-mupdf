
remote_file "/tmp/mupdf-#{node[:mupdf][:version]}-source.tar.gz" do
  source "https://mupdf.googlecode.com/files/mupdf-#{node[:mupdf][:version]}-source.tar.gz"
  checksum node[:mupdf][:checksum]
  notifies :run, "bash[install_mupdf]", :immediately
end

bash "install_mupdf" do
  not_if "/usr/local/bin/mudraw --version | grep -q '#{node[:mupdf][:version]}'"
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zxf mupdf-#{node[:mupdf][:version]}-source.tar.gz
    (cd mupdf-#{node[:mupdf][:version]}-source/ && make && make install)
  EOH
end
