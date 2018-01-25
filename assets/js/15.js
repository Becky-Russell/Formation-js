/**Le DOM */

/**Le DOM est une interface de dvlpmt en JS pour HTML.Grâce au DOM je vais être en mesure d'accèder/modifier mon HTML. 
 * L'Objet "document" : c'est le point d'entrée vers mon contenu HTML.
 * Chaque page chargée dans mon ordinateurà un objet "document".
 * 
 * Comment puis-je faire pour récupérer les différentes informations de ma page HTML.
 * 
 * ****************** document.getElementById****************
 *  document.getElementById() est une fonction que va permettre de récupérer un élément HTML à partir de son identifiant unique : ID.
 */

 var bonjour = document.getElementById('bonjour');
 console.log(bonjour);

 /******************** document.getElementsByClassName****************
 *  document.getElementsByClassName est une fonction que va permettre de récupérer un élément ou plusiuers HTML à partir de leur classe.
*/

var contenu = document.getElementsByClassName('contenu');
console.log(contenu);

/**Me renvoi un tableau JS avec mes éléments HTML (collection HTML). */

/******************** document.getElementsByTagName****************
 *  document.getElementsByTagName est une fonction que va permettre de récupérer un élément ou plusiuers (une liste) HTML à partir de leur "nom de balise".
*/

var span = document.getElementsByTagName('span');
console.log(span);