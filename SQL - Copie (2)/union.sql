--# UNION nous permet de fusionner plusieurs résultat dans une même colonne.

USE bibliotheque;
--# Afficher les auteurs et les abonnés dans une même colonne
SELECT prenom FROM abonne UNION SELECT auteur FROM livre;
-- ou :
SELECT prenom AS 'liste personne' 
FROM abonne 
UNION 
SELECT auteur FROM livre;
    +-------------------+
    | liste personne    |
    +-------------------+
    | Guillaume         |
    | Benoit            |
    | Chloe             |
    | Laura             |
    | Adeline           |
    | GUY DE MAUPASSANT |
    | HONORE DE BALZAC  |
    | ALPHONSE DAUDET   |
    | ALEXANDRE DUMAS   | -- Que une fois les auterus car UNION est+- DISTINCTR
    +-------------------+
    --# UNION fait un distinct par defaut pour avoir toutes les informations (pas de DISTINCT) : UNION ALL
    SELECT prenom AS 'liste personne' 
    FROM abonne 
    UNION ALL
    SELECT auteur FROM livre;
    +-------------------+
    | liste personne    |   -- intéressant car il peut y avoir homonymes par ex dans une entp.
    +-------------------+
    | Guillaume         |
    | Benoit            |
    | Chloe             |
    | Laura             |
    | Adeline           |
    | GUY DE MAUPASSANT |
    | GUY DE MAUPASSANT |
    | HONORE DE BALZAC  |
    | ALPHONSE DAUDET   |
    | ALEXANDRE DUMAS   |
    | ALEXANDRE DUMAS   |
    +-------------------+