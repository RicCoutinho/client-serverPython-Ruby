# frozen_string_literal: true

# file server.rb
require 'socket'

server = TCPServer.open(4000) # Abre socket em escuta na porta 4000
matriculas = %w[P P D D P]

loop do
  client = server.accept
  id = client.recvfrom(10_000).first.to_i - 1
  puts "Matrícula número: #{id.to_i + 1} recebida com sucesso."

  if matriculas[id].nil?
    client.puts "Matrícula: '#{id + 1}' não existe na base."

  elsif matriculas[id] == 'D'
    client.puts 'Passar no setor financeiro. Entrada bloqueada'

  else
    client.puts 'Setor financeiro OK.'
    hospital_server = TCPSocket.open('localhost', 5000)
    hospital_server.puts id

    hospital_answer = hospital_server.recvfrom(10_000)
    char_answer = hospital_answer.first.strip
    puts "esse eh o retorno #{char_answer}"

    if char_answer == 'A'
      client.puts 'Setor Médico OK. Entrada liberada'
    else
      client.puts 'Passar no setor médico. Entrada bloqueada'
    end
  end
end
