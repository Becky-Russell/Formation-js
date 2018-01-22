/** LES OPERATEURS LOGIQUES
 * 
 * #### L'opérateur ET : && ou AND ###
 *  
 * Si la combinaison email user et email correspond, ET la combinaisais mduser et mdp correspond.
 * --> Dans cette condition, les 2 doivent obligatoirement correspondre pour être validée.
 * Ex. if(emailUser == email && mdpUser ==mdp) {...}
 * 
 * #### L'opérateur OU : || ou OR ###
 * 
 * Si la combinaison email user et email correspond ET/OU la combinaison mdpuser et mdp correspond.
 * --> Dans cette condition, au moins l'une des deux doit correspondre pour être validée.
 * Ex. if(emailUser == email &||mdpUser ==mdp) {...}
 * 
 * #### L'opérateur " ! " : ou NOT ###
 * 
 * L'opérateur " ! " signifie le contraire de ou... NOT
 * 
 * var monUtilisateurEstAppeouve = true;
 * if(!monUtilisateurEstApprouve) {...}  --> si la condition n'est pas approuvé alors(...)
 * 
 * Mon utilisateur n'est pas approuvé
 * 
 *Reviens à écrire 
 if(monUtilisateurEstApprouve == false) {}
 */