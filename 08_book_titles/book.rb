class Book
  attr_writer :title

  def title
    capitalize_title(@title)
  end

  def capitalize_title(str)
    str.capitalize!.split.map { |item| %w[and in the of a an].include?(item) ? item : item.capitalize }.join(' ')
  end
end
