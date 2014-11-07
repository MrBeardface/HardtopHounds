$(document).ready(function() {
  $(".cloudinary-fileupload").fileupload({
    start: function(e) {
        $(".update").text("Starting upload...");
      },
      progress: function(e, data) {
        $(".update").text("Uploading... " + Math.round((data.loaded * 100.0) / data.total) + "%");
      },
      fail: function(e, data) {
        $(".update").text("Upload failed");
      }
    }).off(".cloudinarydone").on("cloudinarydone", function(e, data) {
      if ($(".project-form-picture").length <= 5) {
        $(".update").text("");
        preview = $(".project-form-picture").html("");
        $.cloudinary.image(data.result.public_id, {
          format: data.result.format,
          width: 100,
          height: 100,
          crop: "fill"
        }).appendTo(preview).hide().fadeIn(2000);
        delete_button = $("<a href='#'' id='remove-project-photo' class='btn btn-xs btn-danger btn-remove-form-picture'><i class='fa fa-trash-o'></i></a>");
        $(delete_button).appendTo(".project-form-picture");
      } else {
        choose_picture = $(".new-project-form-picture");
        choose_picture.hide();
      }
      $(".image_public_id").val(data.result.public_id);
  });
});