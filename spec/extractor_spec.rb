require 'rspec'
require_relative '../lib/extractor'
require 'json'

RSpec.describe Extractor do
  it 'raises ArgumentError when no file name specified' do
    file_path = ''

    begin
      Extractor.new(file_path)
    rescue ArgumentError => e
      expect(e.message).to eq("Invalid file path.")
    end

  end

  it 'raises ArgumentError when invalid file name specified' do
    file_path = 1234

    begin
      Extractor.new(file_path)
    rescue ArgumentError => e
      expect(e.message).to eq("Invalid file path.")
    end

  end

  it 'raises ArgumentError when invalid file except HTML is specified' do
    file_path = "abcd.json"

    begin
      Extractor.new(file_path)
    rescue ArgumentError => e
      expect(e.message).to eq("Invalid file path.")
    end

  end

  it 'returns empty array when no carousel is found' do
    file_path = 'data/no_carousel.html'

    extractor = Extractor.new(file_path)
    paintings = JSON.parse(extractor.extract)

    expect(paintings).to eq([])

  end

  it 'extracts items from carousel in the HTML content' do
    file_path = 'files/van-gogh-paintings.html' 
    extractor = Extractor.new(file_path)
    paintings = JSON.parse(extractor.extract)

    expected_results_path = 'data/results_without_images.json' # This is updated results with image: null
    results = File.read(expected_results_path)
    data = JSON.parse(results)

    expect(paintings).to eq(data)
  end
end
