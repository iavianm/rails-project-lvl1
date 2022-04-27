# frozen_string_literal: true

module HexletCode
  class Tag
    def self.options(hash)
      attr = []
      unless hash.nil?
        hash.map { |key, value| attr << " #{key}=\"#{value}\"" }
        attr << '>'
      end
      attr.join
    end

    def self.build(tag, options = {}, &block)
      if !tag.empty?
        attr = []
        attr << "<#{tag}"
        attr << options(options)
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
