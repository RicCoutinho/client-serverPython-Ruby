# frozen_string_literal: true

# file server.rb
require 'socket'

server = TCPServer.open(5000) # Abre socket em escuta na porta 4000
matriculas = %w[A A N N N]

loop do # o servidor nunca morre, fica sempre executando
  client = server.accept # aceita conexao do cliente
  id = client.recvfrom(10_000).first.strip
  puts "Matrícula número: #{id.to_i + 1} recebida com sucesso."

  if matriculas[id.to_i] == 'A'
    client.puts 'A'

  elsif matriculas[id.to_i] == 'N'
    client.puts 'N'
  end
end
