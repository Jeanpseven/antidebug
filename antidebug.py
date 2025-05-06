import requests
import json

def v_decrypt(text):
    # Simula descriptografia
    return text

try:
    url = 'http://pastebin.com/raw/xxxxxx'
    response = requests.get(url)
    response.raise_for_status()

    # Corrige entidades HTML
    text = response.text.replace('&quot;', '"')

    # Extrai conteúdo entre "start" e "end"
    start = text.find('start') + len('start')
    end = text.find('end')
    extracted = text[start:end].strip()

    # Interpreta como JSON
    json_data = json.loads(extracted)
    host = json_data['host']
    address = v_decrypt(host).strip()

    print(f"Endereço: {address}")
except Exception as e:
    print(f"Erro: {e}")
