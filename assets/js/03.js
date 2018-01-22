/*****************
La concatenation
**************/

var DebutDePhrase =" Aujoud'hui ";
var DateDuJour = new Date();
var suiteDePhrase =", sont présents : ";
var nombreDeStagiaire = 12 ;
var finDePhrase = " stagiaires.<br>";

/**Nous souhaitons afficher tout dans un seul morceau, grâce à la concaténation, afficher
* tout ce petit monde en un seul morceau.
*/

document.write(DebutDePhrase + DateDuJour.getDate() + "/" +
(DateDuJour.getMonth() + 1) + "/" + DateDuJour.getFullYear() + 
suiteDePhrase + nombreDeStagiaire +finDePhrase);


var phrase1 = "Je mapelle ";
var phrase2 = "Rebecca et j'ai ";
var age     = 28;
var phrase3 = " ans !";

document.write(phrase1 + phrase2 + age + phrase3);