# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag, options = {}, &block)
      "<#{tag}>#{block.call}></#{tag}>" if options.empty? && block_given?

      if block_given?
        attr = []
        attr << "<#{tag}"
        options.map { |key, value| attr << " #{key}=\"#{value}\"" }
        attr << '>'
        attr << block.call
        attr << "</#{tag}>"
        attr.join
      elsif !options.nil?
        attr = []
        attr << "<#{tag}"
        options.map { |key, value| attr << " #{key}=\"#{value}\"" }
        attr << '>'
        attr.join
      else
        "<#{tag}>"
      end
    end
  end
end
