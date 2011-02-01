#!/usr/bin/env ruby -w

path = ARGV[0]
fail "specify the filename for the script to create" unless path

File.open(path, "w"){|f| f.puts "#!/usr/bin/env ruby -w\n"}
File.chmod(0755, path)
system "open", path

