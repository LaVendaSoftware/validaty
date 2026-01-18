class WordCountValidator < Validaty::Base
  def validate_each(resource, attribute, value)
    return if value.blank?

    words = value.to_s.split.size
    min = options[:min]
    max = options[:max]

    if min && words < min
      resource.errors.add(attribute, :too_few_words, count: min)
    end

    if max && words > max
      resource.errors.add(attribute, :too_many_words, count: max)
    end
  end

  private

  def valid_value?(value)
    value.to_s.split.count >= WORDS_QUANTITY
  end
end
