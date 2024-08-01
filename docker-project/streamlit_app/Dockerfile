# Utiliser l'image de base Python
FROM python:3.11-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances et les installer
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copier le code de l'application
COPY app.py app.py

# Exposer le port utilisé par Streamlit
EXPOSE 8501

# Lancer l'application Streamlit
CMD ["streamlit", "run", "app.py"]
