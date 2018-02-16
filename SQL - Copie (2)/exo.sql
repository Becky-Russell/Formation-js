-- Qui conduit la voiture 503
SELECT conducteur.nom, conducteur.prenom FROM conducteur, association_vehicule_conducteur WHERE conducteur.id_conducteur = association_vehicule_conducteur.id_conducteur AND association_vehicule_conducteur.id_vehicule = 503;
+--------+----------+
| nom    | prenom   |
+--------+----------+
| Pandre | Philippe |
+--------+----------+

-- Qui conduit Quoi

-- Ajoutes vous dans la tables des conductieurs 
    -- Afficher toux les conducteurs (sans exception) pour ensuite rajouter les véhicules conduit si c'est le cas
    
-- Ajoutez un nouveau vehicule 
    -- Afficher tous les véhicules (sans exception) pour ensuite rajouter les conducteurs si c'est le cas
    
-- Affichez tous les conducteurs ainsi que les véhicules (sans exception) peu importe les correspondances