# frozen_string_literal: true

# file server.rb
require 'socket'

server = TCPServer.open(5000) # Abre socket em escuta na porta 4000
matriculas = { '001' => 'A', '002' => 'A', '003' => 'D', '004' => 'A',
               '005' => 'A', '006' => 'N', '007' => 'N', '008' => 'A',
               '009' => 'N', '010' => 'A' }

loop do # o servidor nunca morre, fica sempre executando
  client = server.accept # aceita conexao do cliente
  id = client.recvfrom(10_000).first
  puts "Matrícula número: #{id} recebida com sucesso."

  if !matriculas.include?(id)
    client.puts "Matrícula: '#{id}' não existe na base."

  elsif matriculas[id.to_s] == 'A'
    client.puts 'Médico OK.
Entrada liberada.'

  elsif matriculas[id.to_s] == 'N'
    client.puts 'Passar no departamento médico.
Entrada bloqueada'
  end
end
