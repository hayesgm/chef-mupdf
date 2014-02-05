
case node[:platform]
when 'centos','redhat','fedora', 'amazon'
  %w{build-essential pkgconfig libx11-devel libxext-devel}.each { |pkg| package pkg }
when 'debian','ubuntu'
  %w{build-essential pkg-config libx11-dev libxext-dev}.each { |pkg| package pkg }
end

remote_file "/tmp/mupdf-#{node[:mupdf][:version]}-source.tar.gz" do
  source "https://mupdf.googlecode.com/files/mupdf-#{node[:mupdf][:version]}-source.tar.gz"
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
