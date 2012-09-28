class Ventana::EditableContentsController < ApplicationController
  def show
    render text: Ventana::EditableContent.find_by_key(params[:id]).value
  end

  def update
    @editable_content = Ventana::EditableContent.
        find_or_create_by_key(params[:id])

    @editable_content.value = params[:value]
    @editable_content.save
    render json: { id:  @editable_content.id }
  end
end
