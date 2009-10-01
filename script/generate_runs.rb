#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/boot'
require RAILS_ROOT + '/config/environment'

if ARGV.size < 2
  puts "arg 1 is the main ticker symbol"
  puts "arg 2 is the opposite ticker symbol"
  puts "arg 3 is the amount of total money for the run"
  exit 1
end

main = ARGV[0]
opposite = ARGV[1]
amount = ARGV[2].to_f

puts "first clearing all runs"
Run.connection.execute("truncate runs")

Record.find(:all, :conditions => ["ticker = ?",main], :order => "trade_date").each do |start_record|
  Record.find(:all, :conditions => ["ticker = ? and trade_date > ?",main, start_record.trade_date], :order => "trade_date").each do |stop_record|
    main_start = start_record
    main_stop = stop_record
    oppo_start = Record.find(:first, :conditions => ["ticker = ? and trade_date = ?",opposite, start_record.trade_date])
    oppo_stop = Record.find(:first, :conditions => ["ticker = ? and trade_date = ?",opposite, stop_record.trade_date])
    unless oppo_start.nil? or oppo_stop.nil?
      mep = main_start.open
      oep = oppo_start.open
      mxp = main_stop.open
      oxp = oppo_stop.open
      main_shares = ((amount / 2.0) / mep).to_i
      opposite_shares = ((amount / 2.0) / oep).to_i
      g = ((mep - mxp) * main_shares.to_f) + ((oep - oxp) * opposite_shares.to_f)
      pg = (g * 100.0) / amount
      r = Run.new(
              :main => main,
                      :opposite => opposite,
                      :start => start_record.trade_date,
                      :stop => stop_record.trade_date,
                      :main_shares => main_shares,
                      :opposite_shares => opposite_shares,
                      :duration => ((stop_record.trade_date - start_record.trade_date) / 3600 / 24).to_i,
                      :main_enter_price => mep,
                      :opposite_enter_price => oep,
                      :main_exit_price => mxp,
                      :opposite_exit_price => oxp,
                      :gain => g,
                      :percentgain => pg
              )
      r.save!
    else
      puts "no run recorded for #{start_record.trade_date.strftime('%Y-%m-%d')} to #{stop_record.trade_date.strftime('%Y-%m-%d')} due to no data on the opposite ticker"
    end
  end
  puts "#{start_record.trade_date.strftime('%Y-%m-%d')} completed"
  STDOUT.flush
end


puts "There are now #{Run.count} runs"


