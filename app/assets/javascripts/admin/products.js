$(function (){

  $("#product_image").change(function(){
    loadname(this,"preview");
  });

  function loadname(img, previewName) {

    var isIE = (navigator.appName == "Microsoft Internet Explorer");
    var path = img.value;
    var ext = path.substring(path.lastIndexOf('.') + 1).toLowerCase();

    if (ext == "gif" || ext == "jpeg" || ext == "jpg" || ext == "png") {
      if (isIE) {
        $('#' + previewName).attr('src', path);
      } else {
        if (img.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $('#' + previewName).attr('src', e.target.result);
          };
          reader.readAsDataURL(img.files[0]);
        }
      }

    } else {
      alert("It is non image!");
    }
  }
});
