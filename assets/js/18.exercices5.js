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

  // -- ETAPE 2

  age.addEventListener('change', function() {
      if(age.value < 18) {
          ageError.style.display = "block";
          submit.disabled = true;
      } else {
          ageError.style.display = "none";
          submit.disabled = false;
      }
  });       
  
  // -- Etape 4A
  InscriptionForm.addEventListener('submit', function(event) {
      // -- Permet de stopper la redirection HTTP.
      event.preventDefault();

      // -- Créer un Objet membre à ajouter au tableau
      let membre = {
          pseudo  : pseudo.value,
          age     : age.value,
          email   : email.value,
          mdp     : mdp.value
      };
      // console.log(membre);
      membres.push(membre);
      console.log(membres);

      var p = document.createElement('p');
      p.innerHTML = "Merci " + pseudo.value + "! <strong>Tu es maintenant inscrit.</strong><br><br><u>Voici la liste de nos membres :</u>";
      document.body.appendChild(p);

      // -- Générer la liste des membres
      var ul = document.createElement('ul');
      for(let i = 0 ; i < membres.length ; i++) {
          
          let li = document.createElement('li');
          let liste = membres[i].pseudo + " : " + membres[i].age + " ans";
          li.textContent = liste;
          ul.appendChild(li);
      }
      
      // -- Affichage dans la page.
      document.body.appendChild(ul);

  });
