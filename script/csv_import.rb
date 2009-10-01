#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/boot'
require RAILS_ROOT + '/config/environment'

if ARGV.size < 2
  puts "arg 1 is ticker symbol"
  puts "arg 2 is the csv file to import"
  exit 1
end

ticker = ARGV[0]
fn = ARGV[1]

puts "There is now #{Record.count(:conditions=>["ticker=?",ticker])} records for #{ticker}"
puts "first clearing all data for ticker #{ticker}"
Record.connection.execute("delete from records where ticker='#{ticker}'")
puts "There is now #{Record.count(:conditions=>["ticker=?",ticker])} records for #{ticker}"
puts "importing #{fn} for ticker #{ticker}"

fi = File.new(fn, 'r')
begin
  # lose the first line
  fi.gets
  count = 0
  while l = fi.gets
    d = l.strip.split(',')
    r = Record.new(:ticker => ticker, :trade_date => d[0], :open => d[1], :close => d[4], :adj_close => d.last)
    r.save!
    count += 1
  end
  puts "#{count} lines imported"
ensure
  fi.close unless fi.nil?
end
puts "There is now #{Record.count(:conditions=>["ticker=?",ticker])} records for #{ticker}"


