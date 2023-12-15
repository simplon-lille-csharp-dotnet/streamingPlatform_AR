# Ouvrir la base de données

## Si vous disposez de SSMS(Microsoft Server Managment Studio):
-Ouvrir votre logiciel
-clic-droit sur Databases> import Data-tier Application
-cliquer next > browse pour séléctionner le bon fichier > next > choisir du nom et de l'emplacement > cliquer sur finish

## Sans SSMS
Recherche de solution en cours

# Réaliser des opération sur la base de données

-clic sur la base de donnée de la plateforme de streaming
-cliquer dans le menu du haut sur new query

## Afficher les films du plus récent au plus ancien
SELECT title, release_year FROM Movie
ORDER BY release_year DESC;

## Indiquer par ordre alphabétique de prénom et nom les acteurs de plus de 30 ans
SELECT firstname, lastname, birthdate, DATEDIFF(YEAR, CAST(birthdate AS DATE), GETDATE()) AS age FROM Actor
WHERE DATEDIFF(YEAR, CAST(birthdate AS DATE), GETDATE()) >= 30
ORDER BY firstname, lastname;