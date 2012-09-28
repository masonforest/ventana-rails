$(".edit").click(function(){
  $(".editable").html("<textarea id=editor/>")
  $.get('/ventana/editable_contents/'+$(".editable").attr('id'), function(resp){
    $('#editor').val(resp)
  });
  saveButton = $("<a href=#>Save</a>").click(function(){
    value = $("#editor").val()
    $(".editable").html(value);
    $.ajax({
      type: 'PUT',
      url: '/ventana/editable_contents/'+$(".editable").attr('id'),
      data: {value: value}
    })
    $(".edit").replaceWith(saveButton)
  });
  $(".edit").replaceWith(saveButton)
});

