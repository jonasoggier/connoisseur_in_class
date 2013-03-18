require "json"
require "open-uri"

class HtmlGenerator
  
  def show
    print_header
    puts "Action: Show"
    print_footer
  end

  def index
    print_header
    puts "Index of LCBO products"

    products = retrieve_data  #products is an array containing all products

    products.each do |product|
      display_product(product)
    end

    print_footer
  end


  private

  def display_product(product)
    puts "<p>#{product['name']}</p>"
    puts "<p><img src='#{product['image_url']}'></p>"
    puts "<p>#{product['id']}</p>"
    puts "<p>#{product['producer_name']}</p>"
    puts "<p>#{product['primary_category']}</p>"
    puts "<p>#{product['secondary_category']}</p>"
    puts "<p>#{product['package_unit_volume_in_milliliters']} ml</p>"
    puts "<p>$#{product['price_in_cents'].to_f/100}</p>"
  end

  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "  </head>"
    puts "  <body>"
  end

  def print_footer
    puts "  </body>"
    puts "</html>"
  end

  def retrieve_data
    response = open("http://lcboapi.com/products.json").read
    data = JSON.parse(response)
    return data["result"]
  end
















end