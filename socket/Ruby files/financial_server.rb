# frozen_string_literal: true

# file server.rb
require 'socket'

server = TCPServer.open(4000) # Abre socket em escuta na porta 4000
matriculas = %w[P P D D]
loop do
  client = server.accept
  id = client.recvfrom(10_000).first.to_i - 1
  puts "Matrícula número: #{id.to_i + 1} recebida com sucesso."

  hospital_server = TCPSocket.open('localhost', 5000)
  hospital_server.puts id

  hospital_answer = hospital_server.recvfrom(10_000)
  char_answer = hospital_answer.first.split
  puts "esse eh o retorno #{char_answer}"

  if char_answer.nil?
    client.puts "Matrícula: '#{id}' não existe na base."

  elsif char_answer == 'N'
    client.puts 'Passar no departamento médico.
    Entrada bloqueada.'

  elsif char_answer == 'A'
    client.puts 'Departamento médico OK.'

    if matriculas[id.to_i] == 'P'
      client.puts 'Financeiro OK.
      Entrada liberada.'

    elsif matriculas[id.to_i] == 'D'
      client.puts 'Passar no setor financeiro.
      Entrada bloqueada'
    end
  end
end
