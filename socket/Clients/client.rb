# frozen_string_literal: true

# file client.rb
require 'socket'

puts 'BEM-VINDO À ACADEMIA'
puts 'Insira sua matrícula:'
matricula = gets.chomp

financial_server = TCPSocket.open('localhost', 4000)
financial_server.puts matricula # envia o numero pro server

resp = financial_server.recvfrom(10_000).first # recebe o numero - 10000 bytes -

financial_valid = (resp == 'Financeiro OK')
puts resp unless financial_valid

if financial_valid
  hospital_server = TCPSocket.open('localhost', 5000)
  hospital_server.puts matricula # envia o numero pro server

  resp_hospital = hospital_server.recvfrom(10_000).first

  if resp_hospital == '1'
    puts 'Médico OK'
    puts 'Entrada liberada'
  else
    puts resp_hospital
  end
end
