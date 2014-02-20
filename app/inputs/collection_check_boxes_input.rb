class CollectionCheckBoxesInput < SimpleForm::Inputs::CollectionCheckBoxesInput
  def item_wrapper_class
    nested_boolean_style? ? "checkbox-inline" : super
  end
end