$(function (){

  $(".select").change(function() {
    var id = $(this).attr("id");
    var select = $(this).find("select");
    var value = select.val();
    $.ajax({
      type: "PUT",
      url: "/admin/orders/"+id,
      data: {status: value}
    }).done(function(html) {
        alert(html);
      });
  });

});
