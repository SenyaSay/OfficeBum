$(function (){

  $(".orders").on('change', 'select', function() {
    var id = $(this).attr("id");
    var value = $(this).val();
    $.ajax({
      type: "PUT",
      url: "/admin/orders/"+id,
      data: {status: value}
    });
  });

});
