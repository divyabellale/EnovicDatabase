function imagePreview(input) {
  var status = true;
  //var status = validate_file_extn(filename);

  if(status == "false") {
    alert("File type is not supported");
  }
  else {
    var browser_name = getBrowserName();
    if(browser_name.match(/msie/i)){
      var browser_version = getBrowserVersion();
      if(browser_version > 9.0) {
        displayImageInBox(input);
      }
      else {
        displayImageTextInBox(input);
      }
    }

    else {
      displayImageInBox(input);
    }
    
  }

}

function displayImageInBox(input) {
  var reader = '';
  if (input.files && input.files[0]) {
    if(input.files[0].size < 1400000) {
      reader = new FileReader();
      reader.onload = function (e) {
        $(".student-image-container").find('img').attr('src', e.target.result);
        $(".student-image-container").find('img').attr('style','width:50%;height:50%;');
      };
      reader.readAsDataURL(input.files[0]);
    }
    else {
      alert("Maximum Size is 1400KB");
    }

  }
  else {
    var img = input.value;
    $(".student-image-container").find('img').attr('src', img);
        $(".student-image-container").find('img').attr('style','width:50%;height:50%;');
  }
}

function displayImageTextInBox(input) {
  var filename = $(input).val().split('\\').pop();
  $(input).parents('.preview-btn-group').siblings('.student-image-container').html(filename);
}

function getBrowserName() {
  var name = window.navigator.userAgent.match(/msie/i);
  if(name) {
    return name[0];
  }
  else {
    return "";
  }
}

function getBrowserVersion() {
  var rv = -1;
  var ua = window.navigator.userAgent;
  var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
  if (re.exec(ua) != null){
    rv = parseFloat( RegExp.$1 );
  }
  return rv;
}

$(document).on("change", ".file_image_upload", function() {
  var $this = $(this);
  imagePreview(this);
});

$(document).on('click', '.file_image_upload', function(){
});
