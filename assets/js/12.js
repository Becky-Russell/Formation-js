/** LES BOUCLES */

/**La boucles FOR */

for(let i = 0 ; i <=10 ; i++) {
    document.write('<p>Instruction executée : <strong>' + i + '</strong></p>');
}

document.write('<hr>');


/**Les Boucles WHILE */

var j =1;
while(j <=10) {
    document.write('<p>Instruction executée : <strong>' + j + '</strong></p>')

    /**ATENTION A NE PAS OUBLIER L'INCREMENTATION */
    j++;
} 

/** EXERCICE */

/** Supposons le tableau suivant :*/
var Prenoms = ['Jean', 'Marc', 'Mathieu', 'Luc', 'Pierre', 'Paul', 'Jacques', 'Rebecca'];

/**CONSIGNE : Grâce à une boucle FOR afficher la liste des prénoms du tableaux ci-dessus sur la console ou dans votre page .*/

console.log(Prenoms);

/**Avec la boucle FOR */
for(let i = 0 ; i < Prenoms.length ; i++) {
    console.log(Prenoms[i]);
}
console.log('------');

/**Avec la boucles WHILE */
var j = 0
while(j < Prenoms.length) {
    console.log(Prenom[j]);
    j++;
}

console.log('------');
/**La Boucle ForEach */
/**ATTENTION A LA PERFORMANCE (rapidité) */
Prenoms.forEach(affichePrenom);

function affichePrenom(prenom, index) {
    consologe.log(prenom);
}























