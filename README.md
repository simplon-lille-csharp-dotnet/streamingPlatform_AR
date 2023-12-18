# Base de données de la plate-forme de streaming
## Ouvrir la base de données

### Si vous disposez de SSMS(Microsoft Server Managment Studio):
# Attention pour l'instant SSMS n'est pus fonctionnel, se focaliser sur PG admin 4
-Ouvrir votre logiciel
-clic-droit sur Databases> import Data-tier Application
-cliquer next > browse pour sélectionner le fichier bacpac du dossier 001 - fichiers bacpac > next > choisir du nom et de l'emplacement > cliquer sur finish

### Avec PG admin 4 (postGre)
#### Les logiciels
-Installer la dernière version de Postgre
-Installer pgAdmin 4

#### Création de base de données
-Deployer les serveurs sur le menu déroulant de gauche
-clic droit sur database > create > database...
-Nommer la base de données streaming_platform
-Clic sur save
##### ou
Employer le fichier decréation de base de données situé dans le sous-dossier 001 - creer base de donnees

-Cliquer sur la base de données nouvellement créée
-Dans object explorer cliquer sur la première icône en partant de la gauche, l'icône query tool
-Sur la droite, dans query, coller le code à éxecuter puis cliquer sur l'icône execute en réécrivant au dessus des données précédemment exécutées à chaque fois pour ne pas rééxécuter le code précédent.
-Ajouter les code du dossier 002 - pgAdmin 4:
->Le fichier pgAdminTable du sous-dossier 002 tables sql
-> Le fichier pagAdminData du sous-dossier 003 pgAdminData

## Réaliser des opération sur la base de données

### Si vous avez SSMS
-clic sur la base de donnée de la plateforme de streaming
-cliquer dans le menu du haut sur new query

### Avec PG admin 4 (postGre)
Employer la même méthode que celle qui a été employée pour ajouter les tables et les données.


### Afficher les films du plus récent au plus ancien
```SQL
SELECT title, release_year FROM Movie
ORDER BY release_year DESC;
```

### Indiquer par ordre alphabétique de prénom et nom les acteurs de plus de 30 ans
#### Avec SSMS
```SQL
SELECT firstname, lastname, birthdate, DATEDIFF(YEAR, CAST(birthdate AS DATE), GETDATE()) AS age FROM Actor
WHERE DATEDIFF(YEAR, CAST(birthdate AS DATE), GETDATE()) >= 30
ORDER BY firstname, lastname;
```

#### Avec PG admin 4 (postGre)
```SQL
SELECT firstname, lastname, birthdate, EXTRACT(YEAR FROM AGE(birthdate)) AS age FROM Actor
WHERE EXTRACT(YEAR FROM AGE(birthdate)) >= 30
ORDER BY firstname, lastname;
```

### Avoir la liste des acteurs/actrices principaux pour un film donné:
Ce code permet d'avoir par exemple la liste des acteurs principaux du 4ème film de la liste

#### Avec SSMS
```SQL
SELECT FK_ActorID, FK_MovieID, is_lead_role FROM Movie_Actor
WHERE FK_MovieID = 4;

SELECT DISTINCT ActorID, firstname, lastname from Movie_Actor JOIN Actor ON FK_ActorID = ActorID
WHERE FK_MovieID = 4 AND is_lead_role = 1;

SELECT DISTINCT MovieID, title from Movie_Actor JOIN Movie ON FK_MovieID = MovieID
WHERE FK_MovieID = 4;
```

pour avoir la liste des films:
```SQL
SELECT *FROM Movie;
```

#### Avec PG admin 4 (postGre)
Code donnant la liste des acteurs du film et si ils sont lead rôle
```SQL
SELECT FK_ActorID, FK_MovieID, is_lead_role FROM Movie_Actor
WHERE FK_MovieID = 4;
```

Liste des acteurs lead rôle dans le film 4
```SQL
SELECT DISTINCT ActorID, firstname, lastname from Movie_Actor JOIN Actor ON FK_ActorID = ActorID
WHERE FK_MovieID = 4 AND is_lead_role;
```SQL
Nom du 4ème film
```SQL
SELECT DISTINCT MovieID, title from Movie_Actor JOIN Movie ON FK_MovieID = MovieID
WHERE FK_MovieID = 4;
```SQL

pour avoir la liste des films:
```SQL
SELECT *FROM Movie;
```

### Afficher les films dans lesquels le premier acteur de la base de donnée a joué
```SQL
SELECT FK_ActorID, FK_MovieID FROM Movie_Actor
WHERE FK_ActorID = 1;

SELECT DISTINCT ActorID, firstname, lastname from Movie_Actor JOIN Actor ON FK_ActorID = ActorID
WHERE FK_ActorID = 1;

SELECT DISTINCT MovieID, title from Movie_Actor JOIN Movie ON FK_MovieID = MovieID
WHERE FK_ActorID = 1;
```

### Ajouter un film
Pour ajouter un film, les données sont les suivantes:
-Un string titre du film
-La durée en nombre de minutes en int
-l'année en int
-un int correspondant au nème réalisateur de la table director

exemple

#### Avec SSMS
```SQL
INSERT INTO dbo.Movie(title, duration, release_year, FK_DirectorID) VALUES
('Whiplash', '120','2006', '1');
```

#### Avec PG admin 4 (postGre)
```SQL
INSERT INTO Movie(title, duration, release_year, FK_DirectorID) VALUES
('Whiplash', '120','2006', '1');
```

pour voir la liste des films:
```SQL
SELECT *FROM Movie;
```

### Ajouter un acteur/actrice:
Pour ajouter un acteur, les données sont les suivantes:
-Un string prénom
-Un string nom de famille
-une date de naissance au format date yyyy-mm-dd

#### Avec SSMS
```SQL
INSERT INTO dbo.Actor(firstname, lastname, birthdate) VALUES
('John', 'Doe','2023-12-15');
```

#### Avec PG admin 4 (postGre)
```SQL
INSERT INTO Actor(firstname, lastname, birthdate) VALUES
('John', 'Doe','2023-12-15');
```

Pour voir la liste des acteurs:
```SQL
SELECT *FROM Actor;
```

### Modifier un film:
Pour ajouter un acteur, les données sont les suivantes:
-Un string avec le nouveau titre
-Un int durée en minutes
-Un int date de sortie
-un int correspondant au nème réalisateur de la table director

```SQL
UPDATE Movie
SET title = 'Nouveau titre', duration = '80', release_year = '1999', FK_DirectorID = '2'
WHERE MovieID = 2;
```

Pour voir la liste des films:
```SQL
SELECT *FROM Movie;
```

### Supprimer un acteur/actrice:
Pour supprimer le premier acteur de la liste:

#### Avec SSMS
```SQL
DELETE FROM Director
WHERE DirectorID = 1;
```

#### Avec PG admin 4 (postGre)
```SQL
UPDATE Movie SET fk_DirectorId = NULL
WHERE fk_DirectorID = 1;

DELETE FROM Director
WHERE DirectorID = 1;
```

Pour voir la liste des directeurs:
```SQL
SELECT *FROM Director;
```

### Afficher les trois dernier acteurs ajoutés:
Pour avoir les 3 derniers acteurs ajoutés en fonction de la date le code est le suivant:

#### Avec SSMS
```SQL
SELECT TOP (3) [ActorID]
      ,[firstname]
      ,[lastname]
      ,[birthdate]
      ,[created_date]
      ,[modifed_date]
  FROM [DatabaseStreamingPlatform].[dbo].[Actor]
  ORDER BY
    [created_date] DESC;
```

#### Avec PG admin 4 (postGre)
```SQL
SELECT
    ActorID,
    firstname,
    lastname,
    birthdate,
    Actor.created_date,
    Actor.modified_date
FROM
    Actor
ORDER BY
    created_date DESC
LIMIT 3;
```