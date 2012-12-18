class Ventana::VersionsController < ApplicationController
  layout 'ventana/application'

  def revert
    @version = Ventana::EditableContent::Version.find(params[:id])
    if @version.reify
      @version.reify.save!
      redirect_to versions_path
    end
  end

  def index
    @versions = Ventana::EditableContent::Version.order("created_at DESC").first(10)
  end

  def user_for_paper_trail
    current_user.try(:name)
  end
end
