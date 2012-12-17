require 'spec_helper'
describe Ventana::EditableContent, "#render" do
  it 'renders markdown' do
    value = 'foobar'
    content_type = :markdown
    editable_content = build_stubbed(
      :editable_content, 
      value: value,
      content_type: content_type)

    editable_content.render.should == "<p>foobar</p>\n"
  end
end
