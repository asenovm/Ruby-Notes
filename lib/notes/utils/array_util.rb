module Notes
  module ArrayUtil
    def self.array_to_string array
      result = ''
      array.each do |element|
        result += element.to_s
        result += ', '
      end
      result.chop!.chop!
    end
  end
end
