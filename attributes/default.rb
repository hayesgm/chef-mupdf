default[:mupdf][:version] = '1.6'

if node[:kernel][:machine] == 'x86_64'
	default[:mupdf][:arch] = 'amd64'
else
	default[:mupdf][:arch] = 'i386'
end

default[:mupdf][:checksum] = '491d7a3b131589791c7df6dd8161c6bfe41ce74a'
