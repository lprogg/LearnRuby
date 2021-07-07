class Book
  attr_writer :title

  def title
    capitalize_title(@title)
  end

  def capitalize_title(str)
    str.capitalize!
    words_no_cap = %w[and in the of a an]

    str.split.map { |item|
      words_no_cap.include?(item) ? item : item.capitalize
    }.join(' ')
  end
end
