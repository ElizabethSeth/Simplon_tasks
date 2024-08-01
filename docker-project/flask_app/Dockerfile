# Utiliser l'image de base Python
FROM python:3.11-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances et les installer
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copier le code de l'application
COPY app.py app.py

# Exposer le port utilisé par Flask
EXPOSE 5000

# Lancer l'application Flask
CMD ["python", "app.py"]




# # flask_app/Dockerfile
# FROM python:3.9-slim

# WORKDIR /app

# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt

# COPY . .

# CMD ["python", "app.py"]
