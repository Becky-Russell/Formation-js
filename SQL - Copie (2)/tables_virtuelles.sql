-- TABLES VIRTUELLES - VUES
USE entreprise;
CREATE VIEW vue_homme AS SELECT * FROM employes WHERE sexe = "m"; -- permet d'isoler les informations et de continuer à travailler dessus 

SHOW TABLES;

-- pour supprimer une vue
DROP VIEW vue_homme;

-- Pour voir toutes les vues créees
USE information_schema;
SELECT * FROM views;

-- Sur une table virtuelle (vue) nous sauvegardons la requête permettant d'arriver à ce résultat.
-- Pratique pour isoler des info issues d'unes requête compliquée pour ensuite faire d'autres requête sur ce resultat
-- ATTENTION : les données de la table virtuelle sont les même que celles d'origine, si je modofie une donnée sur la table virtuelle, cette donnée sera aussi modifiée sur la table d'origine et l'inverse également.