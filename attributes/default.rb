default[:mupdf][:version] = '1.3'

if node[:kernel][:machine] == 'x86_64'
	default[:mupdf][:arch] = 'amd64'
else
	default[:mupdf][:arch] = 'i386'
end

default[:mupdf][:checksum] = '082325aceb5565b07b82c2b6cc52a97533e03cf9'