# frozen_string_literal: true

# file server.rb
require 'socket'

server = TCPServer.open(4000) # Abre socket em escuta na porta 4000
matriculas = %w[P D P]

loop do
  client = server.accept
  id = client.recvfrom(10_000).first.to_i
  puts "Matrícula número: #{id.to_i} recebida com sucesso."

  if matriculas[id].nil?
    client.puts "Matrícula: '#{id}' não existe na base."

  elsif matriculas[id] == 'D'
    client.puts 'Passar no setor financeiro. Entrada bloqueada'

  else
    client.puts 'Setor financeiro OK.'
    hospital_server = TCPSocket.open('localhost', 5000)
    hospital_server.puts id

    hospital_answer = hospital_server.recvfrom(10_000)
    char_answer = hospital_answer.first.strip

    if char_answer == 'A'
      client.puts 'Setor Médico OK. Entrada liberada'
    elsif char_answer == 'N'
      client.puts 'Passar no setor médico. Entrada bloqueada'
    end
  end
end
