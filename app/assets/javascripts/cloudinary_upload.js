$(document).ready(function() {
	if ($(".form-picture > img").length) {
		choose_picture = $(".new-form-picture");
    choose_picture.hide();

    delete_button = $("<a href='#'' id='remove-avatar' class='btn btn-xs btn-danger btn-remove-form-picture'><i class='fa fa-trash-o'></i></a>");
    $(delete_button).appendTo(".form-picture");
	    $("#remove-avatar").on("click", function(event) {
	      event.preventDefault();
	      answer = confirm("Do you want to delete this?");
	      if (answer) {
	      	var preview = $(".form-picture").html("");
	        choose_picture = $(".new-form-picture");
    			choose_picture.show();
				  $(".cloudinary-fileupload").fileupload({
				    start: function(e) {
				      $(".status").text("Starting upload...");
				    },
				    progress: function(e, data) {
				      $(".status").text("Uploading... " + Math.round((data.loaded * 100.0) / data.total) + "%");
				    },
				    fail: function(e, data) {
				      $(".status").text("Upload failed");
				    }
				  }).off(".cloudinarydone").on("cloudinarydone", function(e, data) {
				    $(".status").text("");
				    preview = $(".form-picture").html("");
				    $.cloudinary.image(data.result.public_id, {
				      format: data.result.format,
				      width: 100,
				      height: 100,
				      crop: "fill"
				    }).appendTo(preview).hide().fadeIn(2000);
				    delete_button = $("<a href='#'' id='remove-avatar' class='btn btn-xs btn-danger btn-remove-form-picture'><i class='fa fa-trash-o'></i></a>");
				    $(delete_button).appendTo(".form-picture");
				   	choose_picture = $(".new-form-picture");
			    	choose_picture.hide();
				    $(".image_public_id").val(data.result.public_id);
				  });
	      } else {
	      	// stay the same
	      }
	    });
	}	else {
	  $(".cloudinary-fileupload").fileupload({
	    start: function(e) {
	      $(".status").text("Starting upload...");
	    },
	    progress: function(e, data) {
	      $(".status").text("Uploading... " + Math.round((data.loaded * 100.0) / data.total) + "%");
	    },
	    fail: function(e, data) {
	      $(".status").text("Upload failed");
	    }
	  }).off(".cloudinarydone").on("cloudinarydone", function(e, data) {
	    var choose_picture, delete_button, preview;
	    $(".status").text("");
	    preview = $(".form-picture").html("");
	    $.cloudinary.image(data.result.public_id, {
	      format: data.result.format,
	      width: 100,
	      height: 100,
	      crop: "fill"
	    }).appendTo(preview).hide().fadeIn(2000);
	    delete_button = $("<a href='#'' id='remove-avatar' class='btn btn-xs btn-danger btn-remove-form-picture'><i class='fa fa-trash-o'></i></a>");
	    $(delete_button).appendTo(".form-picture");
	   	choose_picture = $(".new-form-picture");
    	choose_picture.hide();
	    $(".image_public_id").val(data.result.public_id);
	  });
  };
});