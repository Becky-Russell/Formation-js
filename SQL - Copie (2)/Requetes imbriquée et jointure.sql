-- Creation de la BDD
CREATE DATABASE bibliotheque;

-- On se positionne sur la BDD
USE bibliotheque

-- Faire un copier/Coller du contenu du fichier bibliotheque.sql
SHOW TABLES;
SELECT * FROM abonne; SELECT * FROM emprunt; SELECT * FROM livre;  

-- La valeur NULL se teste avec IS / IS NOT
-- Afficher les id livre qui n'ont pas été rendus
SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;

-- Affiche moi les titres des livres qui n'ont pas été rendus
SELECT titre FROM livre WHERE id_livre IN 
    (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);
-- Les requêtes imbriquées se lisent à l'envers (la 2eme requêtes entre parenthèses est la premieère qui va s'exécuter)

-- Affichage des prénoms des abonnés n'ayant pas encore rendu un livre emprunté
SELECT prenom FROM abonne WHERE id_abonne IN 
    (SELECT id_abonne FROM emprunt WHERE date_rendu IS NULL);
    
-- Affichage des id_livre que Chloé a emprunté a la bibliothèque
SELECT id_livre FROM emprunt WHERE id_abonne IN 
    (SELECT id_abonne FROM abonne WHERE prenom = 'chloe');
    




################################
################################
-- Exercices
-- Affichage des prénoms des abonnés aynat empruntés un livre le 19/12/2014
SELECT prenom FROM abonne WHERE id_abonne IN 
    (SELECT id_abonne FROM emprunt WHERE date_sortie = "2014-12-19"); 
    
-- Affichage du nb de livre que Guillaume à déjà emprunté à la bibliothèque
SELECT COUNT(*) AS 'nb de livre' FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');

-- Affichage des prénoms de abonnés ayant déjà empruntés un livre d'Alphonse Daudet (dans ce cas la on doit utiliser les 3 tableaux)
-- Donc 3 requêtes en imbriquées
SELECT prenom FROM abonne WHERE id_abonne IN
    (SELECT id_abonne FROM emprunt WHERE id_livre IN
        (SELECT id_livre FROM livre WHERE auteur = 'alphonse daudet'));

-- Nous aimerions connaitre le ou les titres des livres empruntés par Chloé
SELECT titre FROM livre WHERE id_livre IN
    (SELECT id_livre FROM emprunt WHERE id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom = 'Chloé'));

-- Nous aimerions connaitre le ou les titres des livres non empruntés par Chloé
SELECT titre FROM livre WHERE id_livre NOT IN
    (SELECT id_livre FROM emprunt WHERE id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom = 'Chloé'));

-- Nous aimerions connaitre les titres des livres que Chloé n'a pas encore rendu à la bibliothèque
SELECT titre FROM livre WHERE id_livre IN
    (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL AND id_abonne IN
        (SELECT id_abonne FROM abonne WHERE prenom = 'Chloé'));

-- Qui (prénom) a emprunté le plus de livre à la bibliothèque
SELECT prenom FROM abonne WHERE id_abonne =
    (SELECT id_adonne FROM emprunt COUNT(*) WHERE ORDER BY GROUP BY LIMIT 0, 1)







#####################################
#####################################
-- REQUETES en JOINTURES
-- En jointures tjrs valides dans tous les cas de figures contrairement au requêtes imbriquées
-- Elles permettent de récuperer des information provenant de plusieurs tables

-- Nous aimerions connaitre les dates de rendues et de sorties pour l'abonnés Guillaume
SELECT date_rendu, date_sortie, prenom
FROM abonne, emprunt
WHERE prenom ='Guillaume'
AND abonne.id_abonne = emprunt.id_abonne;

-- On peut donner des surnom au tables (ce qui donnera exactement le meême résultat)
SELECT date_rendu, date_sortie, prenom
FROM abonne a, emprunt e
WHERE prenom ='Guillaume'
AND a.id_abonne = e.id_abonne;

-- Refaire la même requête mais en imbriquée (sans afficher le prénom dans ce cas)
SELECT date_rendu, date_sortie FROM emprunt WHERE id_abonne IN(SELECT id_abonne FROM abonne WHERE prenom = 'Guillaume');

-- Nous aimerions connaitre les dates de sortie et de rendue pour les livres écrit par Alphonse Daudet
-- 1ère ligne: ce que l'on doit afficher
-- 2ème ligne: les tables dont nous avons besoin
-- 3ème lignes et les suivante la ou les conditions
-- Ensuite si besoin les GROUP BY / ORDER BY
SELECT date_rendu, date_sortie, auteur
FROM emprunt, livre
WHERE livre.auteur = 'alphonse daudet'
AND livre.id_livre = emprunt.id_livre;

-- Qui a emprunté le livre Une Vie sur l'année 2014 (on veut afficher le ou les prénoms)
SELECT abonne.prenom, emprunt.date_sortie, livre.titre
FROM emprunt, livre, abonne
WHERE livre.titre = 'Une Vie' 
AND emprunt.date_sortie LIKE '2014%'
AND emprunt.id_livre = livre.id_livre
AND abonne.id_abonne = emprunt.id_abonne;

-- Nous aimerions connaitre le nombre de livre empruntés par chq abonnés
SELECT abonne.prenom, COUNT(emprunt.id_livre) AS 'nb de livre' 
FROM abonne, emprunt
WHERE abonne.id_abonne = emprunt.id_abonne
GROUP BY abonne.prenom;

SELECT abonne.prenom, COUNT(emprunt.id_livre) AS 'nb de livre' 
FROM abonne, emprunt
WHERE abonne.id_abonne = emprunt.id_abonne
GROUP BY abonne.prenom
ORDER BY COUNT(emprunt.id_livre) DESC
LIMIT 0,1; 

-- Nous aimerions connaitre le nb de livre a rendre pr chq abonné
SELECT abonne.prenom, COUNT(emprunt.date_rendu) AS 'nb de livre emprunté'
FROM abonne, emprunt
WHERE abonne.id_abonne = emprunt.id_abonne
AND emprunt.date_rendu IS NULL
GROUP BY abonne.prenom;

-- Qui a pris quoi et quand 
SELECT abonne.prenom, livre.titre, emprunt.date_sortie
FROM abonne, emprunt, livre
WHERE abonne.id_abonne = emprunt.id_abonne
AND livre.id_livre = emprunt.id_livre;

--  Rajoutez-vous dans la tables abonne
INSERT INTO abonne(prenom) VALUES ('Rebecca');
SELECT * FROM abonne;
                    
-- Affichage des prenoms avec les id livre qu'ils ont empruntés
SELECT abonne.prenom, emprunt.id_livre
FROM emprunt, abonne
WHERE abonne.id_abonne = emprunt.id_abonne;

-- JOINTURE EXTERNES (sans correspondances exigées)
SELECT abonne.prenom, emprunt.id_livre
FROM abonne
LEFT JOIN emprunt ON emprunt.id_abonne = abonne.id_abonne; -- ON = WHERE sur un LEFT ou un RIGHT JOIN

-- même chose en inversant le sens 
SELECT abonne.prenom, emprunt.id_livre
FROM emprunt
LEFT JOIN abonne ON emprunt.id_abonne = abonne.id_abonne;


-- La jointure externe permet de donner la priorité à une table sur laquelle on récupère tout le contenu demandé (sur les exemples ci dessus les prénoms de la table abonne) puis on rajoute les informations des autres tables sur la base des relations .(id_abonne doit être à id_abonne)


-- Même sur 3 tables
SELECT abonne.prenom, emprunt.id_livre, livre.auteur
FROM abonne
LEFT JOIN 




























