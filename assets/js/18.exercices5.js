var membres = [
    {'pseudo':'Hugo','age':26,'email':'wf3@hl-media.fr','mdp':'wf3'},
    {'pseudo':'Rodrigue','age':56,'email':'rodrigue@hl-media.fr','mdp':'roro'},
    {'pseudo':'James','age':78,'email':'james@hl-media.fr','mdp':'james8862'},
    {'pseudo':'Emilio','age':18,'email':'milio@hl-media.fr','mdp':'milioDu62'}
  ];        

 // -- Récupération des différents éléments
 var pseudo              = document.getElementById('pseudo');
 var age                 = document.getElementById('age');
 var email               = document.getElementById('email');
 var mdp                 = document.getElementById('mdp');
 var submit              = document.getElementById('submit');
 var Bienvenue           = document.getElementById('Bienvenue');
 var InscriptionForm     = document.getElementById('InscriptionForm');
 
 var pseudoError = document.getElementsByClassName('pseudoError')[0];
 var ageError    = document.getElementsByClassName('ageError')[0];
 
 // -- ETAPE 1 & 3

 pseudo.addEventListener('input', function () {
     // console.log(pseudo.value);
     for(let i = 0 ; i < membres.length ; i++) {
         // console.log(membres[i]);
         /**
          * Si la saisie d'un pseudo en cours par mon utilisateur
          * correspond à un pseudo dans mon tableau de membres...
          * alors ma condition s'applique.
          * NB : La condition vérifie la saisir de mon utilisateur
          * pour tous les membres du tableau !
          */
         if(pseudo.value === membres[i].pseudo) {
             /**
              * Si je trouve une correspondance, j'affiche l'alerte
              * pseudoError, car le pseudo saisi par mon utilisateur
              * existe déjà dans le tableau de membre.
              */
             pseudoError.style.display = "block";
             submit.disabled = true;
             Bienvenue.textContent = '';
             break;
         } else {
             pseudoError.style.display = "none";
             submit.disabled = false;
             Bienvenue.textContent = 'Bienvenue ' + pseudo.value + ' !';
         }
     }
 });

 var MajoritelegaleFR = 18;

if(14 >= MajoritelegaleFR) {

} else{
    submit.disabled = false;

}


 function monUtilisateurEstCorrect(emailUser, mdpUser) {
    if(emailUser === email && mdpUser === mdp) {
        return true;
    } else {
        return false;
    }
}

var emailUser = prompt("Bonjour, Quel est votre email ?","<Saisissez votre email>");
var mdpUser = prompt("votre mot de passe ?","<Saisissez votre mot de passe>");

if(monUtilisateurEstCorrect(emailUser,mdpUser)) {
    alert('Bienvenue ' + emailUser);
} else {
   alert('ATTENTION, email/mot de passe incorrect.');
}