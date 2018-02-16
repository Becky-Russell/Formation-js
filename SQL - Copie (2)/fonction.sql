--# FONCTIONS PREDEFINIES
--# Inscrite dans le langage, le développeur ne fait que l'exécuter (!= à fct utlisateur)
SELECT DATABASE();  --# affiche la BDD actuellement utilisée
SELECT VERSION();   --# affiche la version mysql

USE bibliotheque
INSERT INTO abonne (prenom) VALUES ('test');
SELECT LAST_INSERT_ID(); --# le dernier id inséré (clé primaire)
        +------------------+
    -> | LAST_INSERT_ID() |
    -> +------------------+     --(ex recupérer id User pour le rajouter à id des abonnés Newsletter)
    -> |                6 |
    -> +------------------+


--# DATE_ADD ou ADDDATE (pour les joujrs ADDDATE) 
--# afin de rajouter une intervalle et d'obtenir la date correspondante.
SELECT DATE_ADD('2018-02-15', INTERVAL 31 DAY);
SELECT DATE_ADD(CURDATE(), INTERVAL 31 YEAR);              
    +---------------------------------------+    --# calcul pour nous la date 31 jrs après
    | 2049-02-15                            |    --#  MAIS la on peut mettre year !
    +---------------------------------------+
SELECT DATE_ADD(CURDATE(), INTERVAL 5 MONTH);
SELECT DATE_ADD(CURDATE(), INTERVAL -12 WEEK);    --# on enlève

    
--#


SELECT ADDDATE(CURDATE(), 31); --# rajoute des jours
    +------------------------+
    | ADDDATE(CURDATE(), 31) |
    +------------------------+
    | 2018-03-18             |
    +------------------------+

SELECT CURDATE();   --# la date du jour, format GB
SELECT CURTIME();   --# l'heure au format HH:MM:SS
SELECT NOW();       --# Affiche et la date et l'heure (super utile sur blog !)
    +---------------------+
    | NOW()               |
    +---------------------+
    | 2018-02-15 17:02:08 |
    +---------------------+

--# Formatage des dates :
--# DATE_FORMAT prend 2 arguments : 1er: la date concernée, 2è le format souhaité
SELECT DATE_FORMAT('2018-02-15 17:07:40', '%d/%m/%Y, à %H:%i:%s');
+------------------------------------------------------------+
| DATE_FORMAT('2018-02-15 17:07:40', '%d/%m/%Y, à %H:%i:%s') |
+------------------------------------------------------------+
| 15/02/2018, à 17:07:40                                     |
+------------------------------------------------------------+
SELECT DATE_FORMAT(CURTIME(), '%H:%i:%s');
    +------------------------------------+
    | 17:16:14                           |
    +------------------------------------+
SELECT DATE_FORMAT(date_sortie, '%d/%m/%Y') AS 'Date for' FROM emprunt;
    +------------+
    | Date for   |
    +------------+
    | 17/12/2014 |
    | 18/12/2014 |
    | 19/12/2014 |
    | 19/12/2014 |
    | 19/12/2014 |
    | 20/03/2015 |
    | 13/06/2015 |
    | 15/06/2015 |
    +------------+

--# %d est un token (jeton de remplacement) permettant d'afficher l'information correspondante 
--# lors de l'exécution de la fonction (c'est nous qui les appellons selon ce qu'on veut récup)
--# %Y en maj pour avoir l'année en 4 chiffres
--# %H en maj pour avoir l'heure sur 24 (%h pour l'avoir sur 12)


--# doc Date and Time Functions
--# https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html
--# doc Functions & Operators
--# https://dev.mysql.com/doc/refman/5.5/en/functions.html

--# localhost/date/date.php > time stamp pour pouvoir donner date ! nb de sec dep le 1er janvier 1970 à minuit

SELECT DAYNAME('1970-08-01'); --# le nom du jour correspondant :)

-- Pour générer les mots de passe
SELECT PASSWORD ("nom mot de passe");


-- On peut faire des opération numérique également (mais faire attention au décimal)
SELECT 1+1;
SELECT 4560456*45604;

-- Concatenation
SELECT CONCAT ("a", "b", "c");
SELECT CONCAT_WS ("-", "a", "b", "c"); -- WITH SEPARATOR concaténation avec séparateur, le 1er argument est le séparateur

SELECT CONCAT_WS ("-", auteur, titre) AS 'les livres' FROM livre; 
+-----------------------------------------+
| les livres                              |
+-----------------------------------------+
| GUY DE MAUPASSANT-Une vie               |
| GUY DE MAUPASSANT-Bel-Ami               |
| HONORE DE BALZAC-Le père Goriot         |
| ALPHONSE DAUDET-Le Petit chose          |
| ALEXANDRE DUMAS-La Reine Margot         |
| ALEXANDRE DUMAS-Les Trois Mousquetaires |
+-----------------------------------------+


-- La fonction LENGHT permet de compter le nb de caractère dans la chaine fournie en argument
SELECT LENGTH ("abcé");
+-----------------+
| LENGTH ("abcé") |
+-----------------+
|               4 |
+-----------------+

-- Pour passer en majuscule
SELECT UPPER ("bonjour");

-- Pour passer en minuscule
SELECT LOWER ("bonjour")

-- Enlève les espace qui entourent la chaîne de caractère
SELECT TRIM ("          Bonjour à tous                       "); 


















