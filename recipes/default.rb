
remote_file "/tmp/mupdf-#{node[:mupdf][:version]}-source.tar.gz" do
  source "http://www.mupdf.com/download/archive/mupdf-#{node[:mupdf][:version]}-source.tar.gz"
  checksum node[:mupdf][:checksum]
  notifies :run, "bash[install_mupdf]", :immediately
end

bash "install_mupdf" do
  not_if {File.exists?("/usr/local/bin/mudraw")}
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zxf mupdf-#{node[:mupdf][:version]}-source.tar.gz
    (cd mupdf-#{node[:mupdf][:version]}-source/ && make build=release && make install)
  EOH
end
