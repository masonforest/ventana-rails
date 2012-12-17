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
      $(_this.$el).find(".ventana-edit").after(
      $("<a href=# class=ventana-save>Save</a>").click(function (e) {
        value = $(this).parent().find("textarea").val()
        console.log(value)
        $.ajax({
          type: 'PUT',
          url: '/ventana/editable_contents/' + $(this).parent().data('key'),
          data: {
            value: value
          },
          context: this,
          success: function (resp) {
            $(this).parent().find(".ventana-content").html(resp);
            $(this).parent().find(".ventana-content").show();
            $(this).parent().find(".ventana-editor").hide();
            $(this).parent().find(".ventana-save").hide();
            $(this).parent().find(".ventana-edit").show();
          },
          error: function (a, b) {
            console.log(b)
          }
        })
        $(this).parent().find(".ventana-edit").hide();
        $(this).parents(".ventana-block").removeClass(".ventana-editing");
        e.preventDefault();
      }).hide());

      $(_this.$el).find(".ventana-edit").click(function (e) {
        e.preventDefault();
        $(this).parent().find(".ventana-save").show();
        editor = $("<textarea class=ventana-editor/>")
        editor.width($(this).parent().find(".ventana-content").width() - 10);
        editor.height($(this).parent().find(".ventana-content").height());
        $(this).parent().find(".ventana-content").hide();
        $(this).parents(".ventana-block").addClass("ventana-editing");
        editor.css("display","block")
        $(this).parent().find(".ventana-content").after(editor);
        $.ajax({
          type: 'GET',
          url: '/ventana/editable_contents/' + $(this).parent().data('key'),
          context: this,
          success: function (resp) {
            $(this).parent().find('textarea').val(resp);
            $(this).parent().find('textarea').autogrow();
          }
        });
        $(this).parent().find(".ventana-edit").hide();
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
