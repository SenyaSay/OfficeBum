$(function(){
   $("#cart").live('click', function(){
       $("#cart > :not(h3)").toggle();
   })
});
