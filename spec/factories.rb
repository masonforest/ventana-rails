FactoryGirl.define do
  factory :editable_content, class: Ventana::EditableContent do
    key "test-key"
    value "content"
    content_type "text"
  end
end
