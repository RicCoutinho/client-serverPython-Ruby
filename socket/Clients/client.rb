# frozen_string_literal: true

# file client.rb
require 'socket'

puts 'BEM-VINDO À ACADEMIA'
puts 'Insira sua matrícula:'
matricula = gets.chomp

server = TCPSocket.open('localhost', 4000)
server.puts matricula # envia o numero pro server

resp = server.recvfrom(10_000) # recebe o numero - 10000 bytes -
puts resp

server.close # Fecha a conexao com o servidor
