/**************************LES EVENEMENTS***************************************** */

/**Les évenements vont me permettre de déclencher un fonction, c'est à dire une série d'instructions ; suite à une action de mon utilisateur...
 * 
 * OBJECTIF : Etre en mesure de capturer ces évenements afin d'éxecuter une fonction.
 * 
 * Les évenements : MOUSSE (Souris)
 *      - click      : au click sur un élément.
 *      - mouseenter : la souris passe au dessus de la zone d'un élément.
 *      - mouseleave : la souris sort de cette zonne.
 * 
 * Les évenements : KEYBOARD (clavier)
 *      - keydown : losqu'une touche du clavier est enfoncée.
 *      - keyup   : lorsqu'une touche du clavier à été relachée.
 * 
 * Les évenements : WINDOW (fênetre)
 *      - scroll : défilement de la fênetre.
 *      - resize : redimensionnement de la fenêtre.
 * 
 * Les évenements : FORM (formulaire)
 *      - change : pour les éléments <input>, <slect> et <textarea>.
 *      - submit : à l'envoi (la soumission du formulaire).
 *      - input : pour capter la saisie de l'utilisateur sur un champ <input>.
 */

 /****************************LES ECOUTEURS D'EVENEMENTS ***************************
  * 
  Pour atacher un évenement à un élément ou autrement dit, pour déclarer un écouter d'évenement qui se chargera de déclencher une fonction, je vais utiliser la syntaxe suivante : 
 */
var p = document.getElementById('MonParagraphe');

//--- Je souhaite que mon paragraphe soit rouge au click de la souris.

function changerLaCouleurEnRouge() {
    p.style.color = "red";
}

p.addEventListener('click', changerLaCouleurEnRouge);

/* -------------------------------------------------------------\
|                       EXERCICE PRATIQUE                       |
| A l'aide de javascript, créez un champ "input" type text avec |
| un ID unique. Affichez ensuite dans une alerte, la saisie de  |
| l'utilisateur.                                                |
|______________________________________________________________*/

// -- Création du champ input
var input = document.createElement('input');
document.body.appendChild(p);

// -- Attribution d'un Attribut
input.setAttribute('type', 'text');
input.setAttribute('placeholder', 'Saisissez un Contenu...');

//-- Attribution d'un ID
input.id = "MonID";

// -- Ajout dans la page
document.body.appendChild(input);

function voirLaSaisieDeMonInput() {
    console.log(input.value);
    alert(input.value);
}

input.addEventListener('change', voirLaSaisieDeMonInput);