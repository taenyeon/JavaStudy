var i=1
var j=1
$(function (){
   $("#option1").click(function (){
   if (i<4){
      $("#add_Option1").append('<td colspan=1>'+'하위옵션'+i+'<input type=text name=option_child1_'+i+'></td>')
      i++;
   }
   });
   $("#option2").click(function (){
   if (j<4){
      $("#add_Option2").append('<td colspan=1>'+'하위옵션'+j+'<input type=text name=option_child2_'+j+'></td>')
      j++;
   }
   });
   if ($("#selOp1 option:selected").valueOf() != null){
      $("#selOp2").removeAttr("disabled");

   } else {
      $("#selOp2").attr("disabled","disabled");
   }
   // $(submit).click(function (){
   //    $("#content").valueOf().replace(/(?:\r\n|\r|\n)/g,'<br/>');
   // })

});

