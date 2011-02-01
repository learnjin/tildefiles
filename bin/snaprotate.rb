#!/usr/bin/env ruby -w

require 'rubygems'
require 'optparse'
require 'ostruct'

options = OpenStruct.new
op = OptionParser.new do |op|
  op.banner = "Usage: #{File.basename($0)} -v VOLUME_ID -l NUMBER\n"
  op.on('-v', '--volume-id VOLUME_ID', 'the EBS volume ID from which to count snapshots') do |v|
    options.volume = v
  end
  op.on('-l', '--leave NUMBER', Integer, 'the number of recent snapshots to keep') do |l|
    options.leave = l
  end
end

begin op.parse!
rescue => e
  puts e
  puts op
  exit 1
end

unless (options.volume and options.leave) or ARGV[1]
  puts op; exit 1
end

n=0
%x[ec2-describe-snapshots | grep #{options.volume} | sort -rk 5].each do |line|
  n=n+1
  f = line.split
  if n>options.leave
    puts "deleting snapshot #{f[1]}"
    system "ec2-delete-snapshot #{f[1]}"
  end
end




