# frozen_string_literal: true

# file client.rb
require 'socket'

puts 'CONTATOR DE PALAVRAS'
puts 'INSIRA A SUA PALAVRA:'
word = gets.chomp

server = TCPSocket.open('localhost', 5000) # conecta ao servidor na porta 3001
server.puts word # envia o numero pro server

resp = server.recvfrom(10_000) # recebe o numero - 10000 bytes -
puts resp

server.close # Fecha a conexao com o servidor
