# frozen_string_literal: true

module HexletCode
  class Tag
    def self.options(hash)
      attr = []
      hash.map { |key, value| attr << " #{key}=\"#{value}\"" }
    end

    def self.build(tag, options = {}, &block)
      "<#{tag}>#{block.call}></#{tag}>" if options.empty? && block_given?

      if !options.nil?
        attr = []
        attr << "<#{tag}"
        attr << options(options)
        attr << '>'
        if block_given?
          attr << block.call
          attr << "</#{tag}>"
        end
        attr.join
      else
        "<#{tag}>"
      end
    end
  end
end
