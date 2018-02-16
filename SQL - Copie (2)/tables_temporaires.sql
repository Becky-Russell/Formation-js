-- TABLES TEMPORAIRES
-- Grosse dufférences avec la table virtuelle, si on modifie données, les modif ne seront pas repercutées sur la table d'origines.

CREATE TEMPORARY TABLE emprunt2014 AS SELECT * FROM emprunt WHERE date_sortie LIKE "2014";
-- le AS permet de définir la requête voulue

SHOW TABLES;
SELECT * FROM emprunt 2014;

-- Une table temporaire est contruite à partir d'une requête et de colonnes de tables existantes
-- Pratique pour isoler des résultats afin de faire des tests dessus sans impacter les données d'origines
-- ATTENTION : les données d'une table temporaire ne sont pas liées aux données d'origines. Si je modofie une donnée sur la table temporaire, cela n'impacteras pas les données sur la table d'origine.

-- Durée de vie très courte. Si on ferme la console (session) la table est supprimée automatiquement.