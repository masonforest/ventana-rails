require 'spec_helper'
describe Ventana::EditableContent, "#render" do
  it 'renders text' do
    value = 'foobar'
    content_type = :text
    editable_content = build_stubbed(
      :editable_content, 
      value: value,
      content_type: content_type)

    editable_content.render.should == 'foobar'
  end
end
