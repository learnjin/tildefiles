#!/usr/bin/env ruby -w

# == Synopsis
#   This program creates a snapshot of a specified Amazon EBS volume with the XFS filesystem.
#   It will take care of locking the database and freezing the filesystem.
#   
#   If a MySQL database is to be read locked before the snapshot, the client connection parameters
#   must be stored in the .my.cnf file 
#
# == Examples
#   snappy -m /vol -v vol-12345678 -d production
#
# == Usage
#   snappy -v EBS_VOLUME_ID -m MOUNTPOINT -d production
#


require 'rubygems'
require 'activerecord'
require 'rdoc/usage'
require 'date'
require 'optparse'
require 'ostruct'

options = OpenStruct.new

op = OptionParser.new do |op|
  op.banner = "Usage: snappy -v VOLUME_ID -m MOUNTPOINT -d DATABASE\n\n"
  op.on('-v', '--volume-id VOLUME_ID', 'EBS Volume ID') do |v|
    options.volume = v
  end
  op.on('-m', '--mountpoint MOUNTPOINT', 'Mount point of the EBS XFS filesystem') do |m|
    options.mountpoint = m
  end
  op.on('-d', '--database DATABASE', 'Database that needs to be locked before the snapshot') do |d|
    options.database = d
  end
  op.on( '-h', '--help', 'Display this screen' ) do
    puts op; exit(1)
  end
end

op.parse!

unless (options.volume and options.mountpoint and options.database)
  puts op; exit(1)
end

File.open(File.expand_path("~/.my.cnf")) do |f|
  while line=f.gets
    options.username = $1 if line =~ /^\s*user\s*=\s*(\S+)/
    options.password = $1 if line =~ /^\s*password\s*=\s*(\S+)/
  end
end

conn = ActiveRecord::Base.establish_connection(
  :adapter=>'mysql',
  :database=>options.database,
  :user=>options.username,
  :password=>options.password
)

ActiveRecord::Base.connection.execute("FLUSH TABLES WITH READ LOCK;")
ActiveRecord::Base.connection.execute("SHOW MASTER STATUS;")

system("echo sudo xfs_freeze -f #{options.mountpoint}")
system("echo ec2-create-snapshot #{options.volume_id}")
system("echo sudo xfs_freeze -u #{options.mountpoint}")

ActiveRecord::Base.connection.execute("UNLOCK TABLES;")


