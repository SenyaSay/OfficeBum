$(function(){
  $("body").on('click', ".edit_order_product", function(){
    var $td = $(this).parent().parent().find(".quantity");
    var value = $td.find("span").text();
    $td.html("<form class='edit_product_value'><input type='text' name='count' value='" + value + "'><input type='submit' value='OK'></form>");
  });

  $("body").on('submit', "form.edit_product_value", function(){
    var id = $(this).parent().parent().attr("id");
    var value = $(this).find("input[type='text']").val();
    $.ajax({
      url: "/cart_products",
      type: "PUT",
      data: { id: id, count: value }
    });
    return false;
  });
});