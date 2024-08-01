# Utilisez une image de base appropriée
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier de configuration des dépendances
COPY requirements.txt requirements.txt

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port utilisé par Jupyter
EXPOSE 8888

# Commande pour démarrer Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]
