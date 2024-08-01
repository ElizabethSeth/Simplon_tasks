This is my Projet Docker : Plateforme de gestion et d'analyse de données
Préparation et démarrage :¶ J'ai vérifié que Docker et Docker Compose étaient installés sur ma machine. Ensuite, j'ai créé et navigué vers le répertoire du projet avec la commande # cd docker-project. J'ai configuré et démarré les services nécessaires (MongoDB, Mongo Express, Flask, Streamlit, Jupyter) en utilisant Docker Compose avec la commande # docker-compose up --build

J'ai pris comme base un projet lié à Airbnb pour rechercher des équipements dans différents pays. Les données étaient stockées dans une base de données non relationnelle, MongoDB, que j'ai utilisée pour cet exercice. Le projet consistait à interroger cette base de données pour trouver des annonces en fonction des équipements spécifiés.

J'ai créé une application web en utilisant Flask et MongoDB. J'ai configuré une route pour afficher une page d'accueil et une autre pour rechercher des annonces en fonction des équipements spécifiés par l'utilisateur. Lorsqu'un utilisateur soumet une recherche, l'application interroge la base de données MongoDB et renvoie une liste d'annonces correspondantes au format JSON. Puis j'ai créé un fichier Docker pour conteneuriser mon flask pro. Ce fichier spécifie l'utilisation d'une image de base Python 3.8 slim, définit le répertoire de travail, copie le fichier requirements.txt et installe les dépendances nécessaires Flask et PyMongo. Ensuite, il copie le reste des fichiers de l'application et définit la commande pour exécuter l'application Flask

Résumé des commandes clés Démarrer les services : docker-compose up --build ou docker-compose up -d Vérifier les logs : docker-compose logs Arrêter les services : docker-compose down Accéder à Mongo Express : http://localhost:8081 Accéder à l'API Flask : http://localhost:5000 Accéder à Streamlit : http://localhost:8501 Accéder à Jupyter : http://localhost:8887
![visualisation](https://github.com/user-attachments/assets/b64c8a31-9ade-499f-9784-7801ebf136ca)
![visualis](https://github.com/user-attachments/assets/9004fe12-0a8d-4e91-a50d-9050892636a5)
![the flask app](https://github.com/user-attachments/assets/f9ce3764-ee6c-413a-8371-8ca1d0bdedaa)
![streamlit](https://github.com/user-attachments/assets/9b0ccc3b-499f-4801-ae00-1f1f6163ce65)
![insert_data_in_express](https://github.com/user-attachments/assets/b8f7e110-2324-4aff-b845-fefcf239694a)
![docker_cont](https://github.com/user-attachments/assets/d2db9f70-5d20-4531-8d72-0fd43693dc07)
![data_to_mongo_exp](https://github.com/user-attachments/assets/d8ede7aa-0db6-4040-97d5-90740d2fb9c9)
![working_host_serv](https://github.com/user-attachments/assets/685d53cb-fef4-4bbb-9d86-67292ae885bf)
