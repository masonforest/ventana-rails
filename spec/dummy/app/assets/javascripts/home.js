$(".edit").click(function(e){
  e.preventDefault();
  $(".editable").html("<textarea id=editor/>")
  $.get('/ventana/editable_contents/'+$(".editable").attr('id'), function(resp){
    $('#editor').val(resp);
  });
  saveButton = $("<a href=#>Save</a>").click(function(e){
    value = $("#editor").val()
    $.ajax({
      type: 'PUT',
      url: '/ventana/editable_contents/'+$(".editable").attr('id'),
      data: {value: value},
      success: function(resp,respText){
        console.log(resp)
        $(".editable").html(resp);
      },
      error: function(a,b){
        console.log(b)
      }
    })
    $(".edit").replaceWith(saveButton);
    e.preventDefault();
  });
  $(".edit").replaceWith(saveButton)
});
