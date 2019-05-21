class XmlElementBuilder
  def with_tag(name)
    @tag_name = name
  end

  def with_attributes(attributes)
    @attributes = attributes.map { |k, v| " #{k}='#{v}'" }.join
  end

  def with_content(content)
    @content = content
  end

  def indent
    @indent = true
  end

  def build
    @tokens = []

    if empty_element_tag?
      @tokens << "<#{@tag_name}#{@attributes}/>"
    else
      @tokens << "<#{@tag_name}#{@attributes}>"
      @tokens << @content
      @tokens << "</#{@tag_name}>"
    end

    indent_tokens! if @indent
    @tokens.join
  end

  def indent_tokens!
    unless empty_element_tag?
      @tokens[1] = @tokens[1].split("\n").map { |tok| "  #{tok}" }.join("\n")
    end

    @tokens.map! { |token| token << "\n" }
  end

  def empty_element_tag?
    @content.nil?
  end
end
