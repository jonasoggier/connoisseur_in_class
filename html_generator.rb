require "json"
require "open-uri"

class HtmlGenerator
  
  def show
    print_header
    puts "<h1>Action: Show</h1>"

    products = retrieve_data  #'products' is an array containing all products
    first_product = products[0]  #access first product, which is a hash

    product_details(first_product)  #'first_product' is a hash

    print_footer
  end

  def index
    print_header
    puts "<h1>Index of LCBO products</h1>"

    products = retrieve_data  #'products' is an array containing all products

    products.each do |product|   #'product' is a hash
      display_product(product)
    end

    print_footer
  end


  private

  def display_product(product)   #we pass in a hash ('product')
    puts "<p>#{product['name']}</p>"
    puts "<p><img src='#{product['image_url']}'></p>"
    puts "<p>#{product['id']}</p>"
    puts "<p>#{product['producer_name']}</p>"
    puts "<p>#{product['primary_category']}</p>"
    puts "<p>#{product['secondary_category']}</p>"
    puts "<p>#{product['package_unit_volume_in_milliliters']} ml</p>"
    puts "<p>$#{product['price_in_cents'].to_f/100}</p>"
  end

  def product_details(product)   #we pass in a hash ('product')
    puts "<p>#{product['name']}</p>"
    puts "<p><img src='#{product['image_url']}'></p>"
    puts "<p>#{product['id']}</p>"
    puts "<p>#{product['producer_name']}</p>"
    puts "<p>#{product['primary_category']}</p>"
    puts "<p>#{product['secondary_category']}</p>"
    puts "<p>#{product['package_unit_volume_in_milliliters']} ml</p>"
    puts "<p>$#{product['price_in_cents'].to_f/100}</p>"
    puts "<p>#{product['package_unit_type'].capitalize}</p>"
    puts "<p>#{product['package']}</p>"
    puts "<p>#{product['sugar_content']}</p>"
    puts "<p>#{product['origin']}</p>"
    puts "<p>#{product['updated_at']}</p>"
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