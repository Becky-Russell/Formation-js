-- LES TRANSACTIONS
-- même genre que les tables virtuelle permet de travailler/modifier les donner mais de pour ensuite choisir si oui ou non on veut garder le travaille qu'on a fait --> afin d'éviter les erreurs.

USE entreprise;
START TRANSACTION ; -- Démarre la zone de la mise en tampon (mémoire vive).
SELECT * FROM employes;
UPDATE employes SET prenom = "test";
SELECT * FROM employes;

-- Pour annuler toutes les opérations depuis le début de la transaction 
ROLLBACK;
SELECT * FROM employes;

-- Pour valider toutes les opération depuis le début de la transaction 
COMMIT;

-- Après un ROLLBACK ou un COMMIT, la transaction est finie 

#######################
#######################
-- TRANSACTIONS AVANCEES & SAVEPOINT

START TRANSACTION; 
SELECT * FROM employes;

SAVEPOINT point1; -- point de sauvegarde
UPDATE employes SET salaire = 1000;
SELECT * FROM employes;

SAVEPOINT point2; -- point de sauvegarde
UPDATE employes SET salaire = 5000;
SELECT * FROM employes;

SAVEPOINT point3; -- point de sauvegarde
DELETE FROM employes;
SELECT * FROM employes;

ROLLBACK TO point 2; -- on annule les opérations executées après le point 2

COMMIT; -- pour valider les opérations

ROLLBACK; -- Annule tout depuis le start de la transation (pour ça qu'il est important de faire des savepoint)
























