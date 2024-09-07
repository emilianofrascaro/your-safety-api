class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A#{URI::regexp(['http', 'https'])}\z/
      record.errors[attribute] << (options[:message] || "non è un URL valido")
    end
  end
end
