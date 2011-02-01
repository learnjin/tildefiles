#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'
require 'pp'

page = 1
res = Twitter::Search.new('#iphone').per_page(100).page(1).fetch()
tweets = res.results
while res.next_page and page < 17
  page+=1
  last = tweets.last.id
  res = Twitter::Search.new('#iphone').per_page(100).max(last).page(page).fetch()
  tweets += res.results
end

pp tweets.size





