-- commentaire SQL
# commentaire SQL

-- # Pour créer une BDD
CREATE DATABASE nom_de_la_bdd;
CREATE TABLE nom_de_la_table;

-- # Pour voir toutes les BDD presentent sur le serveur
SHOW DATABESES;

-- # Pr voir les tables 
SHOW TABLES;

-- # Pr les warnings
SHOW WARNINGS;

-- # Pour se positionner sur une BDD afin de l'utiliser 
USE nom_de_la_bdd;

-- #Pour supp une BDD
DROP DATABASE nom_de_la_bdd;

-- # Pr supp une TABLE
DROP TABLE nom_de_la_table;

-- # Pr vider une table sans la supp
TRUNCATE nom_de_la_table

-- # Pr voir la structure d'une table
DESC nom_de_la_table 

-- # REQUETES DE SELECTION (question)
-- Pour voier le contenu complet de la table, nous pouvons appeler tous les champs
SELECT id_employes, nom, prenom, sexe, service, date_embauche, salaire FROM employes;
-- mémé chose avec * (tout selectionner)
SELECT * FROM employes;

-- affichage des noms et prénoms uniquement
SELECT nom, prenom FROM employes;

-- EXERCICE : afficher les services de la table employes
SELECT service FROM employes;

-- Afficher les différents services sans restrictions
SELECT DISTINCT service FROM employes

-- les noms, prénoms, services uniquement du service informatique
SELECT nom, prenom, service FROM employes WHERE service='informatique';

-- WHERE --> a la condition de 

-- Affichage des employés ayant été recrutés entre le 1er janvier 2010 et aujourd'hui
SELECT * FROM employes WHERE date_embauche BETWEEN "2010_01_01" and "2018_02_14";

SELECT CURDATE(); -- nous renvoit à la date du jour 

SELECT * FROM employes WHEREE date_embauche BETWEEN "2010-01-01" AND CURDATE();
SELECT * FROM employes WHERE date_embauche >="2010-01-01";

-- LIKE
-- afficher les emplyer ayant un prénom commençant par s
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "s%";

-- terminant par "ie"
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "%ie";
-- on inverse le sens grace au %
-- contenant "ie" n'importe ou dans la chaîne
SELECT prenom, nom, service FROM employes WHERE prenom LIKE "%ie%";

-- Explution - différent de
SELECT nom, prenom, service FROM employes WHERE service != 'informatique';

-- Opérateurs de comparaison :
-- > strictement supérieur
-- < strictement inférieur
-- >= sup ou égal
-- <= inf ou égal
-- = est égal à 
-- != est différent de 

-- Nous voulon afficher les informations des employés ayant un salaire sup à 3000
SELECT salaire, nom, prenom FROM employes WHERE salaire > 3000;

-- ORDER BY 
-- ordinner selon le prénom
SELECT prenom, nom, salaire FROM employes ORDER BY prenom ASC; -- (ASC par défaut (ascendant))
SELECT prenom, nom, salaire FROM employes ORDER BY prenom DESC; -- (DESC par défaut (descendant))


SELECT prenom, nom, salaire FROM employes ORDER BY salaire DESC, prenom ASC; -- on peut mettre plusieurs données sur le ORDER BY pour affiner recherche

-- LIMIT
SELECT * FROM employes ORDER BY nom LIMIT 0, 3; -- depuis 0 jusqu'a la ligne 3 (1er info valeurs de départ) 2eme info nombre de ligne depuis valeur de départ
-- LIMIT permet de limiter le nb de résultat. Si on ne fournit qu'1 seule valeur à LIMIT, cette valeur représente le nb de ligne à récupérer. 

-- Attention SQL gère très très mal les décimales

-- salaire annuel des employés: (donc sur 12 mois)
SELECT prenom, salaire*12 FROM employes; 

-- en donnat un surnom au salaire *12 (permet en terme de gestion des données d'être plus clair)
SELECT prenom, salaire*12 AS salaire_annuel FROM employes;


-- fontcion SUM() (attention ne peut renvoyer qu'une seule information) va faire la somme de ce que l'on lui demande
-- masse salariale
SELECT SUM(salaire*12) AS 'Masse Salariale' FROM employes; 

-- fonction AVG()
-- le salaire moyen
SELECT AVG(salaire) AS 'Salaire Moyen' FROM employes; 

-- ROUND() pour arrondir le résultat
SELECT ROUND(AVG(salaire)) AS 'Salaire Moyen' FROM employes; -- résultat entier
SELECT ROUND(AVG(salaire), 2) AS 'Salaire Moyen' FROM employes; -- le "2" représente le nombre de décimal que l'on souhaite (2ème arguments)

-- connaitre le nb de ligne présente sur une table
-- fonction COUNT()
SELECT COUNT(*) AS 'nombre de femme' FROM employes WHERE sexe="f"; 
-- COUNT() permet de comtper le nb de ligne. Il est possible de mettre un count() sur un champs pécis exemple : COUNT(service) mais si ce champs contient la valeur null, le COUNT() n'en tiendra pas compte.

-- MIN() et MAX()
-- affichage du salaire max de la table 
SELECT MAX(salaire) FROM employes;

-- affichage du salaire minimum et du prenom de l'employé concerné
SELECT prenom, salaire FROM employes WHERE salaire = (SELECT MIN(salaire) FROM employes);
-- On fait une requête imbriquée on répond en premier a la question entre parenthère (la recherche du salaire) et ensuite du nom 
 -- ou alors avec un order by + limit
 SELECT prenom, salaire FROM employes ORDER BY salaire LIMIT 0, 1;
 -- on ordonne celon un choix et on choisit uniquement la 1ere ligne 
 
-- une condition sur plusieurs valeurs
SELECT * FROM employes WHERE employes IN('informatique','comptabilite');
-- l'inverse 
SELECT * FROM employes WHERE employes NOT IN('informatique','comptabilite');

-- AND
SELECT nom, prenom, service, salaire FROM employes WHERE service = 'commercial' AND salaire <= 2000;

-- OR 
SELECT * FROM employes WHERE service = 'production' AND (salaire = 1900 OR salaire = 2300);
-- attention on rajoute les parenthèses : même logique que pour les opérations mathématiques.

-- GROUP BY regrouper des informations selon un cas/une information
SELECT service, COUNT(*) AS 'nombre d\'employe' FROM employes GROUP BY service;

-- Pour mettre une condition sur un GROUP BY HAVING 
SELECT service, COUNT(*) AS 'nombre d\'employe' FROM employes GROUP BY service HAVING COUNT(*) >= 2;




####################################
####################################
-- LES REQUETES D'ENREGISTREMENT - INSERT INTO

INSERT INTO employes (id_employes, nom, prenom, sexe, service, salaire, date_embauche) VALUES(991, 'Rebecca', 'Russell', 'f', 'informatique', 2000, '2018-02-14'); 

INSERT INTO employes VALUES(992, 'Tristan', 'Lambert', 'm', 'sncf', CURDATE(), 2000); -- même action mais attention la il faut mettre les infos exactement dans le même ordre que le tableaux de bases 



################################
################################
-- REQUETE DE MODIFICATION - UPDATE
SELECT * FROM employes; -- afin de bien vérifier que les modifs soient faites
UPDATE employes SET salaire = 1395, nom = 'Cotte' WHERE id_employes = 699; -- SET --> donne la valaur à


##################################
##################################
-- REQUETES DE SUPPRESSION - DELETE
SELECT * FROM employes;
DELETE FROM employes WHERE prenom LIKE 'Tristan%';
DELETE FROM employes WHERE id_employes =  992;
SELECT * FROM employes;



################################
################################
-- EXERCICES
-- 1- Afficher la profession de l'empyé 547
SELECT service, id_employes FROM employes WHERE id_employes = 547;

-- 2- Afficher ladate de l'embauche d'Amandine
SELECT date_embauche FROM employes WHERE prenom = 'Amandine';

-- 3- Afficher le nom de famille de Guillaume
SELECT nom FROM employes WHERE prenom = 'Guillaume';

-- 4- Afficher le nb de pers ayant un id commençant par le chiffre 5
SELECT COUNT(*) FROM employes WHERE id_employes LIKE '5%';

-- 5- Afficher le nb de commerciaux
SELECT COUNT(*) FROM employes WHERE service = 'commercial';

-- 6- Afficher le salaire moyen des informaticiens
SELECT AVG(salaire) AS 'Salaire Moyen' FROM employes WHERE service ='informatique'; 

-- 7- Addicher les 5 premiers employés après avoir classé par leur nom ordre alphabétique
SELECT * FROM employes ORDER BY nom LIMIT 0, 5;

-- 8- Addicher le coût des commerciaux sur une année
SELECT SUM(salaire*12) AS 'masse salariale' FROM employes WHERE service ='commercial';

-- 9- Afficher le salaire mayen par service
SELECT service, ROUND(AVG(salaire), 2) FROM employes GROUP BY service; 

-- 10- Afficher le nb de recrutement sur l'année 2010 avec un alias (AS)
SELECT date_embauche AS 'Recrutement 2010' FROM employes WHERE date_embauche LIME '2010%';

-- 11- Afficher le salaire moyen des employés ayant été recrutées sur la période de 2005 à 2007 inclu
SELECT ROUND(AVG(salaire), 2) AS ' Salaire moiyen' FROM employes WHERE date_embauche BETWEEN '2005-01-01' AND '2007-12-31';

-- 12- Afficher le nb de diff services
SELECT COUNT(DISTINCT service) AS 'nb des differents services' FROM employes;

-- 13- Afficher toux les employés sauf ceux des services production et secrétériat
SELECT nom, prenom, service FROM employes WHERE service != 'production' AND service != 'secreteriat';
SELECT nom, prenom, service FROM employes WHERE services NOT IN ('production', 'secreteriat');

-- 14- Afficher conjointement le nb de femme et le nb d'homme
SELECT sexe, COUNT(*) AS 'nombre' FROM employes GROUP BY sexe;

-- 15- Qui a été embhauché en dernier
SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 0,1;
SELECT * FRom employes WHERE date_embauhche = (SELECT MAX (date_emchauche) FROM employes);

-- 16- Afficher les informations de l'employé du service commercial ayant le salaire el plus élevé
SELECT * FROM employes WHERE service = 'commercial' ORDER BY salaire DESC LIMIT 0, 1;  

-- 17- Afficher le prenom deu comptable ayant le salaire le plus élevé
SELECT * FROM employes WHERE service = 'comptable' ORDER BY salaire DESC LIMIT 0, 1;  

-- 18- Afficher les commerciaux ayant été  recruté avant 205 de sexe masculin et gagnant un salaire sup à 2500
SELECT * 
FROM employes
WHERE service = 'commercial' 
AND date_embauche < '2005-01-01'
AND sexe = 'm'
AND salaire > 2500;

-- 19- Afficher le prenom de l'informaticien ayant été recruté en premier
SELECT prenom, service 
FROM employes
WHERE service = 'informatique'
ORDER BY date_embauche
LIMIT 0, 1;

-- 20- Augmenter chq employés
UPDATE employes SET salaire = (salaire + 100);















































































































