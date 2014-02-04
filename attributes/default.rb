default[:mupdf][:version] = '1.3'

if node[:kernel][:machine] == 'x86_64'
	default[:mupdf][:arch] = 'amd64'
else
	default[:mupdf][:arch] = 'i386'
end
