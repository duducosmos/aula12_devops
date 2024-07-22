# Use uma imagem base do Python
FROM python:3.9-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos de requisitos para o contêiner
COPY requirements.txt requirements.txt

# Instale as dependências
RUN pip install -r requirements.txt

# Copie o restante do código para o contêiner
COPY . .

# Defina a variável de ambiente para o Flask
ENV FLASK_APP=app
ENV FLASK_RUN_HOST=0.0.0.0

# Exponha a porta onde a aplicação Flask será executada
EXPOSE 5000

# Comando para rodar a aplicação
CMD ["flask", "run"]
