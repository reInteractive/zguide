# author: Bill Desmarais bill@witsaid.com
# this code is licenced under the MIT/X11 licence.

require 'rubygems'
require 'ffi-rzmq'

context = ZMQ::Context.new(1)

puts "Starting Hello World server..."

# socket to listen for clients
socket = context.socket(ZMQ::REP)
socket.bind("tcp://*:5555")

while true do
  # Wait for next request from client

  # Initialize a string object and receive the message into it
  message = ''
  request = socket.recv_string(message)

  puts "Received request. Data: #{message}"

  # Do some 'work'
  sleep 1

  # Send reply back to client
  socket.send_string("world")
end
