require 'spec_helper'

describe 'VentanaHelper' do
  describe "editable_content_for" do
    include Ventana::EditableContentHelper
    it 'is wrapped in a div with the id of key prepended with ventana' do
      user = mock('user', can_edit_with_ventana?: true)
      self.should_receive(:current_user).twice.and_return(user)
      key = 'test'

      editable_content_for(key).should have_tag("#ventana-#{key}")
    end

    it 'is wrapped in a div with the class of editable' do
      key = 'test'
      user = mock('user', can_edit_with_ventana?: true)
      self.should_receive(:current_user).twice.and_return(user)

      editable_content_for(key).should have_tag(".ventana-editable")
    end

    it 'contains a link to edit the content' do
      key = 'test'
      user = mock('user', can_edit_with_ventana?: true)
      self.should_receive(:current_user).twice.and_return(user)

      editable_content_for(key).should have_tag("a")
    end

    it 'renders markdown' do
      key = 'home'
      value = '*Welcome*'
      editable_content = build_stubbed(:editable_content,
                                       value: value,
                                       content_type: :markdown)
      Ventana::EditableContent.stub_chain(
        :where,
        :first).
        and_return(editable_content)
      content_type = :markdown
      user = mock('user', can_edit_with_ventana?: true)

      self.should_receive(:current_user).twice.and_return(user)

      editable_content_for(key).should include("<em>Welcome</em>")
    end
  end
end
