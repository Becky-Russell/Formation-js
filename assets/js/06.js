/* ----------------
LES FONCTIONS
-----------------*/

// -- Déclarer une fonction 
// NB : Cette fontion ne retourne aucune valeur et ne prend pas de paramètres.
function Bonjour() {
    /*** Lors de l'appel de cette fonction, les instructions co-dessous seront executées...  */
    alert('Bonjour ! ');
}
/**Je vais appeler ma fonction "Bonjour" et déclencher ses instructions. */
Bonjour();


/**Declarer une fonction qui prend une variable en paramètre */
function ditBonjour(Prenom, Nom) {
    document.write("<p>Bonjour <strong>" + Prenom + " " + Nom +"</strong> !</p>");
}

/**Appeler / Utiliser une fonctions avec des paramètres */
ditBonjour("Rebecca", "RUSSELL");


/**
 * EXERCICE :
 * Créer une fontcion permettant d'éffectuer l'addition de deux nombres passés en paramètre.
 */
nb1 = 2;
nb2 = 3;

 function addition(nb1, nb2) {
     return nb1 + nb2;
 }

document.write("<p>" + addition(10, 5) + "</p>");
































