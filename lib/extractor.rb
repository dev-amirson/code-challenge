require 'bundler/setup'
require 'json'

require_relative 'utils'


class Extractor
  include Utils

  def initialize(file_path)
    unless file_path.is_a?(String) && !file_path.empty? && file_path.end_with?('.html')
      raise ArgumentError, "Invalid file path."
    end

    @file_path = file_path
  end

  def extract
    doc = parse_html(@file_path)

    carousel = get_carousel(doc)
    return [] if carousel.nil?

    links = get_links(carousel)
    return [] if links.nil?

    items = get_items(links)

    items.to_json
  end

end

# extractor = Extractor.new('files/van-gogh-paintings.html') # To test the extractor output
# p extractor.extract
