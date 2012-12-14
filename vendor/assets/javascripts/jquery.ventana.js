//= require jquery.autogrow

(function ($) {

  function Ventana(el, options) {

    //Defaults:
    this.defaults = {};

    //Extending options:
    this.opts = $.extend({}, this.defaults, options);

    //Privates:
    this.$el = $(el);
  }

  // Separate functionality from object creation
  Ventana.prototype = {

    init: function () {
      var _this = this;
      $(_this.$el).find(".edit").after(
      $("<a href=# class=save>Save</a>").click(function (e) {
        value = $(this).parent().find("textarea").val()
        $.ajax({
          type: 'PUT',
          url: '/ventana/editable_contents/' + $(this).parent().data('key'),
          data: {
            value: value
          },
          context: this,
          success: function (resp) {
            $(this).parent().find(".editable").html(resp);
            $(this).parent().find(".editable").show();
            $(this).parent().find(".editor").hide();
            $(this).parent().find(".save").hide();
            $(this).parent().find(".edit").show();
          },
          error: function (a, b) {
            console.log(b)
          }
        })
        $(this).parent().find(".edit").hide();
        $(this).parents(".ventana-block").removeClass("editing");
        e.preventDefault();
      }).hide());

      $(_this.$el).find(".edit").click(function (e) {
        e.preventDefault();
        $(this).parent().find(".save").show();
        editor = $("<textarea class=editor/>")
        editor.width($(this).parent().find(".editable").width() - 10);
        editor.height($(this).parent().find(".editable").height());
        $(this).parent().find(".editable").hide();
        $(this).parents(".ventana-block").addClass("editing");
        editor.css("display","block")
        $(this).parent().find(".editable").after(editor);
        $.ajax({
          type: 'GET',
          url: '/ventana/editable_contents/' + $(this).parent().data('key'),
          context: this,
          success: function (resp) {
            $(this).parent().find('textarea').val(resp);
            $(this).parent().find('textarea').autogrow();
          }
        });
        $(this).parent().find(".edit").hide();
      });
    }
  };

  // The actual plugin
  $.fn.ventana = function (options) {
    if (this.length) {
      this.each(function () {
        var rev = new Ventana(this, options);
        rev.init();
        $(this).data('ventana', rev);
      });
    }
  };
})(jQuery);
$(function(){
  $(".ventana-block").ventana();
});
