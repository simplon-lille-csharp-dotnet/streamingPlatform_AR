# Base de données de la plate-forme de streaming
## Ouvrir la base de données

### Si vous disposez de SSMS(Microsoft Server Managment Studio):
-Ouvrir votre logiciel
-clic-droit sur Databases> import Data-tier Application
-cliquer next > browse pour sélectionner le fichier bacpac du dossier 001 - fichiers bacpac > next > choisir du nom et de l'emplacement > cliquer sur finish

### Sans SSMS
-Créez votre base de données
-Chargez le sql du fichier scriptStreamingPlatform.sql du dossier 003 - script sql
-Pour ajouter les données, charger le sql du fichier dataStreamingPlatform.sql du dossier 004 - données des tables sql

## Réaliser des opération sur la base de données

### Si vous avez SSMS
-clic sur la base de donnée de la plateforme de streaming
-cliquer dans le menu du haut sur new query

### Autrement
Entrez le code sql là où vous l'ajoutez habituellement

### Afficher les films du plus récent au plus ancien
SELECT title, release_year FROM Movie
ORDER BY release_year DESC;

### Indiquer par ordre alphabétique de prénom et nom les acteurs de plus de 30 ans
SELECT firstname, lastname, birthdate, DATEDIFF(YEAR, CAST(birthdate AS DATE), GETDATE()) AS age FROM Actor
WHERE DATEDIFF(YEAR, CAST(birthdate AS DATE), GETDATE()) >= 30
ORDER BY firstname, lastname;

### Avoir la liste des acteurs/actrices principaux pour un film donné:
Ce code permet d'avoir par exemple la liste des acteurs principaux du 4ème film de la liste

SELECT FK_ActorID, FK_MovieID, is_lead_role FROM Movie_Actor
WHERE FK_MovieID = 4;

SELECT DISTINCT ActorID, firstname, lastname from Movie_Actor JOIN Actor ON FK_ActorID = ActorID
WHERE FK_MovieID = 4 AND is_lead_role = 1;

SELECT DISTINCT MovieID, title from Movie_Actor JOIN Movie ON FK_MovieID = MovieID
WHERE FK_MovieID = 4;

pour avoir la liste des films:

SELECT *FROM Movie;

### Afficher les films dans lesquels le premier acteur de la base de donnée a joué
SELECT FK_ActorID, FK_MovieID FROM Movie_Actor
WHERE FK_actorID = 1;

SELECT DISTINCT ActorID, firstname, lastname from Movie_Actor JOIN Actor ON FK_ActorID = ActorID
WHERE FK_actorID = 1;

SELECT DISTINCT MovieID, title from Movie_Actor JOIN Movie ON FK_MovieID = MovieID
WHERE FK_actorID = 1;

#### Afficher les films dans lesquels le nème acteur de la base de donnée a joué
SELECT FK_ActorID, FK_MovieID FROM Movie_Actor
WHERE FK_actorID = n;

SELECT DISTINCT ActorID, firstname, lastname from Movie_Actor JOIN Actor ON FK_ActorID = ActorID
WHERE FK_actorID = n;

SELECT DISTINCT MovieID, title from Movie_Actor JOIN Movie ON FK_MovieID = MovieID
WHERE FK_actorID = n;

### Ajouter un film
Pour ajouter un film, les données sont les suivantes:
-Un string titre du film
-La durée en nombre de minutes en int
-l'année en int
-un int correspondant au nème réalisateur de la table director

INSERT INTO dbo.Movie(title, duration, release_year, FK_DirectorID) VALUES
('Titre du film', '120','2006', '1');

pour voir la liste des réalisateurs:

SELECT *FROM Director;

### Ajouter un acteur/actrice:
Pour ajouter un acteur, les données sont les suivantes:
-Un string prénom
-Un string nom de famille
-une date de naissance au format date yyyy-mm-dd

INSERT INTO dbo.Actor(firstname, lastname, birthdate) VALUES
('John', 'Doe','2023-12-15'),

### Modifier un film:
Pour ajouter un acteur, les données sont les suivantes:
-Un string avec le nouveau titre
-Un int durée en minutes
-Un int date de sortie
-un int correspondant au nème réalisateur de la table director

UPDATE Movie
SET title = 'Nouveau title', duration = '80', release_year = '1999', FK_DirectorID = '2'
WHERE MovieID = 2;

### Supprimer un acteur/actrice:
Pour supprimer le premier acteur de la liste:

DELETE FROM Director
WHERE DirectorID = 1;

Pour supprimer le nème acteur de la liste:

DELETE FROM Director
WHERE DirectorID = n;

### Afficher les trois dernier acteurs ajoutés:
Pour avoir les 3 derniers acteurs ajoutés en fonction de la date le code est le suivant:

SELECT TOP (3) [ActorID]
      ,[firstname]
      ,[lastname]
      ,[birthdate]
      ,[created_date]
      ,[modifed_date]
  FROM [DatabaseStreamingPlatform].[dbo].[Actor]
  ORDER BY
    [created_date] DESC;