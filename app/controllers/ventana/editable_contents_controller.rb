class Ventana::EditableContentsController < ApplicationController
  layout false
  before_filter :authorize

  def show
    render text: Ventana::EditableContent.find_by_key(params[:id]).value
  end

  def update
    @editable_content = Ventana::EditableContent.
        find_or_create_by_key(params[:id])

    @editable_content.value = params[:value]
    @editable_content.save

    render text: @editable_content.render
  end

  def edit
    @editable_content = Ventana::EditableContent.
        find_or_create_by_key(params[:id])
  end

  def authorize
    if !authorized?
      return render text: "Unauthorized", status: 401
    end
  end

  def authorized?
    (defined? current_user) && current_user.try(:can_edit_with_ventana?)
  end

  def user_for_paper_trail
    current_user.try(:name)
  end
end
