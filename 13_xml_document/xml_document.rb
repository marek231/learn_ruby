require 'xml_element_builder'

class XmlDocument
  def initialize(indent = false)
    @indent = indent
  end

  def generate_document(name, attributes = {})
    element_builder = XmlElementBuilder.new
    element_builder.with_tag(name)
    element_builder.with_attributes(attributes)
    element_builder.with_content(yield) if block_given?
    element_builder.indent if @indent
    element_builder.build
  end

  def method_missing(name, *args, &block)
    generate_document(name, *args, &block)
  end
end
