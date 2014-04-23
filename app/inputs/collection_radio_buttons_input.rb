class CollectionRadioButtonsInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def item_wrapper_class
   nested_boolean_style? ? 'radio-inline' : super
  end
end
