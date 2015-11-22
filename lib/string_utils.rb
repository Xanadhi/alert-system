class String

  def convert_to_phone
    number = self.gsub(/\D/, '').split(//)

    #US 11-digit numbers
    number = number.drop(1) if (number.count == 11 && number[0] == 1)

	number = number.join(",").gsub(",","")

    return number
  end

  def format_phone
    return "#{self[0,3]}-#{self[3,3]}-#{self[6,4]}"
  end

end