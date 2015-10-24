
function changeImage() {
  var image = document.getElementById('easter egg');
    if (image.src.match("/img/chomp.JPG")) {
      image.src = "/img/chompchomp.GIF";
    } 
    else {
      image.src = "/img/chomp.JPG";
    }
}
