/** LA DISPONIBILITE DU DOM
 * 
 * A partir du moment ou mon DOM, cad l'ardorescence de ma page HTML est complètement chargée, je peux commencer à utiliser JQuery.
 * 
 * Je vais mettre l'ensemble de mon code de mon code dans un foonction cette fonction sera appelée AUTOMATIQUEMENT !!! par jQuery lorsque le DOM sera entièrement défini.
 * 
 * 3 façons de faire : 
 */

 jQuery(document).ready(function() {
     //-- Ici, le DOM est entièrement chargé, je peux procéder à mon code JS...
 });

 //-- 2ème possibilité :
 $(document).ready(function() {
    //-- Ici, le DOM est entièrement chargé, je peux procéder à mon code JS...
});

//-- 3ème possibilité :
$(function() {
    //-- Ici, le DOM est entièrement chargé, je peux procéder à mon code JS...
});

//-- 4èeme posibilité la plus courte 
$(() =>{
    alert('Bienvenue dans ce cours de jQuery')

});

//-- En JS :
//-- En jQuery, les sélecteurs sont les mêmes quen CSS !! 
$('#TexteEnJquery').html('Mon Texte en JQ');
})
