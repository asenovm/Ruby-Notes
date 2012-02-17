module Notes
  module Options
    class OptionParser
      def initialize(args)
        @parsed_options = {}
      end

      def parse
        @parsed_options = Trollop::options do
            Options.get_options.each do |option|
              opt option.name, option.description, option.options
            end
        end
        @parsed_options
      end
    end
  end
end
