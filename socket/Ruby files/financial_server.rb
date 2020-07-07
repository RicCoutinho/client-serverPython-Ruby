# frozen_string_literal: true

# file server.rb
require 'socket'

server = TCPServer.open(4000) # Abre socket em escuta na porta 4000
matriculas = { '001' => 'P', '002' => 'P', '003' => 'D', '004' => 'P',
               '005' => 'P', '006' => 'D', '007' => 'D', '008' => 'P',
               '009' => 'D', '010' => 'P' }

loop do # o servidor nunca morre, fica sempre executando
  client = server.accept # aceita conexao do cliente
  id = client.recvfrom(10_000).first
  puts "Matrícula número: #{id} recebida com sucesso."

  if !matriculas.include?(id)
    client.puts "Matrícula: '#{id}' não existe na base."

  elsif matriculas[id.to_s] == 'P'
    client.puts 'Financeiro OK.
Entrada liberada.'

  elsif matriculas[id.to_s] == 'D'
    client.puts 'Passar no setor financeiro.
Entrada bloqueada'
  end
end
