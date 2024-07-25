require 'nokogiri'

module Utils

	def parse_html(file_path)
		begin
			return Nokogiri::HTML(File.read(file_path))
		rescue Nokogiri::XML::SyntaxError => e
			raise "Invalid HTML content provided: #{e.message}"
		end
	end

	def get_carousel(doc)
		carousels = doc.css('g-scrolling-carousel')
		carousels.first
	end

	def get_links(carousel)
		links = carousel.css('a')
    return nil if links.empty?
		
		links
	end

	def get_items(links)
		paintings = []

		links.reject { |link| link['aria-label'].nil? }.each do |link|
      item = { name: link['aria-label'], link: nil, image: nil }

			item[:link] = link['href'] unless link['href'].nil?
			item[:link] = "https://www.google.com" + item[:link] unless item[:link].start_with?('https://www.google.com')

			# item[:image] = link.css('img').first["src"] unless link.css('img').first.nil? && link.css('img').first["src"].nil? # Need to discuss issue with image src provided in HTML file.

      nested_text = link.xpath('.//text()').map { |i| i&.text&.strip }.join(" ")
      extensions =  nested_text.sub(link['aria-label'], "").strip.split(" ")

      item[:extensions] = extensions unless extensions.empty?

      paintings << item
		end

		paintings
	end

end
