require 'spec_helper'

feature "authorized user can save content" do
  scenario "authorized user can save content" do
    Ventana::EditableContentsController.any_instance.stub(authorized?: true)
    key = "home"
    editable_content = "my string"
    put ventana.editable_content_path(
      key,
      {value: editable_content}
    )
    response.status.should eq(200)
    get ventana.editable_content_path(key)
    response.body.should == editable_content
  end
  scenario "unauthorized user cannot save content" do
   Ventana::EditableContentsController.any_instance.stub(authorized?: false)
   key = "home"
   editable_content = "my string"
   put ventana.editable_content_path(
     key,
     {value: editable_content}
   )
   response.status.should eq(401)
  end
end
