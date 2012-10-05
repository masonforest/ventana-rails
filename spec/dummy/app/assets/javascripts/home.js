$(".edit").click(function (e) {
  e.preventDefault();
  $(".editable").hide();
  $(".editable").after("<textarea id=editor/>")
  $.get('/ventana/editable_contents/' + $(".editable").attr('id'), function (resp) {
    $('#editor').val(resp);
  });
  saveButton = $("<a href=# class=save>Save</a>").click(function (e) {
    value = $("#editor").val()
    $.ajax({
      type: 'PUT',
      url: '/ventana/editable_contents/' + $(".editable").attr('id'),
      data: {
        value: value
      },
      success: function (resp, respText) {
        $(".editable").html(resp);
        $(".editable").show();
        $("#editor").hide();
        $(".save").hide();
        $(".edit").show();
      },
      error: function (a, b) {
        console.log(b)
      }
    })
    $(".edit").hide();
    e.preventDefault();
  });
  $(".edit").hide();
  $(".edit").after(saveButton);
});
