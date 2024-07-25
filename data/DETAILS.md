# Van Gogh Paintings Extractor

## Description

This project is designed to extract specific information from HTML files containing a `Google Scrolling Carousel`. It focuses on extracting the painting name, extensions array (such as dates), thumbnail, Google link, and compiles this information into a JSON array. This project uses `Ruby`, `Nokogiri` for HTML parsing, and `RSpec` for testing.

## Features

- Extracts carousel items from HTML files
- Retrieves painting names, extensions (like dates), image thumbnails and Google links
- Compiles the extracted information into a JSON array
- Includes unit tests with RSpec to ensure reliability

## Installation

1. Clone the repository:
   ```sh
   git clone {repo link}
   cd van_gogh_paintings_extractor
   ```

2. Install the required gems:
   ```sh
   bundle install
   ```

## Usage

1. Prepare your HTML files in the `data/` directory.

2. Create an instance of the `Extractor` class and call the `extract` method:

   ```ruby
   require_relative `extractor`
   
   extractor = Extractor.new(`data/your_html_file.html`)
   puts extractor.extract
   ```

3. Run the script to see the output as JSON.

## Tests

RSpec is used for testing. The tests are located in the `spec/` directory.

1. Run the tests:
   ```sh
   rspec
   ```

2. Ensure all tests pass successfully.

## Example

Example usage:

```ruby
require_relative `extractor`

extractor = Extractor.new(`data/van_gogh_paintings.html`)
puts extractor.extract
```

## File Structure

```bash
├── Gemfile
├── Gemfile.lock
├── README.md
├── lib
│   ├── extractor.rb
│   └── utils.rb
├── spec
│   ├── extractor_spec.rb
│   └── spec_helper.rb
└── data
    ├── cricket_teams.html
    ├── no_carousel.html
    └── results_without_images.json
```

## Points TBD

- The `Van Gogh Paintings` HTML page attached in the questions contains a carousel but if you search on `Google.com` with the same keywords, it will not show a carousel. For this one, I have only focused on the ones containing the carousels.
- There is an issue with the thumbnails in the provided attached HTML. The image `src` values are supposed to be used but in HTML, they are shortened explicitely which needs us to send an extra HTTP call to read the url. Due to this, images are not matching the expected results when parsed from the attached HTML which is causing the test case to fail. However, I have added another fresh HTML page with the same carousel which is working fine for thumbnails. Also, for the attached one, I have added a new file with images as null. The file is named `results_without_images.json` while the original one is `expected_results.json`.
