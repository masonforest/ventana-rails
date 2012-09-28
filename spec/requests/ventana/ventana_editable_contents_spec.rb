require 'spec_helper'

feature "user can save content" do
  scenario "saving content content" do
    key = "home"
    editable_content = "my string"
    put ventana.editable_content_path(
      key,
      {value: editable_content}
    )
    response.status.should be(200)
    get ventana.editable_content_path(key)
    response.body.should == editable_content
  end
end
