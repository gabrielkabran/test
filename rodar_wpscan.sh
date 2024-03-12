#!/bin/bash

# Caminho para o script WPScan
caminho_wpscan="/var/lib/gems/3.0.0/gems/wpscan-3.8.25/lib/wpscan.rb"

# Ler a lista de domínios do arquivo
arquivo_lista="domains.txt"
while IFS= read -r dominio || [[ -n "$dominio" ]]; do
    # Remover quebras de linha
    dominio=$(echo "$dominio" | tr -d '\n')

    # Executar o WPScan para o domínio atual
    ruby "$caminho_wpscan" --url "$dominio" --disable-tls-checks --rua --output /usr/scripts/result.txt
done < "$arquivo_lista"