#!/usr/bin/env ruby
require 'socket'

if ARGV.size != 3
  puts "Usage: wakeup.rb <host> <port> <mac address>"
  exit
end

host     = ARGV[0]
port     = ARGV[1]
mac_addr = ARGV[2]

if host !~ /^[\w\.\-\_\&\@]+$/
  puts "Wrong format of host. Exiting..."
  exit
elsif port !~ /^\d+$/
  puts "Wrong format of port. Exiting..."
  exit
elsif mac_addr !~ /^([0-9a-fA-F]{2}[:-]){5}([0-9a-fA-F]{2})$/ 
  puts "Wrong format of mac address. Exiting..."
  exit
end

mac_addr = mac_addr.gsub(/(:|-)/,'').upcase

magic_packet = "FF" * 6
magic_packet += "#{mac_addr}" * 16
magic_packet = magic_packet.lines.to_a.pack('H*')

begin
  sock = UDPSocket.new
  sock.send(magic_packet, 0, host, port.to_i)
rescue SocketError => e
  puts "Connection error: #{e} (SocketError)."
  exit
end

puts "Magic packet sent to #{host} : #{ARGV[2]} !"

