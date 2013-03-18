require "json"
require "open-uri"

class HtmlGenerator
  
  def index
    print_header
    puts "<h1>Index of LCBO products</h1>"

    products = retrieve_data("http://lcboapi.com/products.json")  #'products' is an array containing all products (which are hashes)

    products.each do |product|   #'product' is a hash
      display_product(product)
    end

    print_footer
  end

  def show(id)
    print_header
    puts "<h1>Show Individual Product</h1>"

    product = retrieve_data("http://lcboapi.com/products/#{id}.json")  #'product' is a hash

    display_detailed_product(product)  #'product' is a hash

    print_footer
  end


  private

  def display_product(product)   #we pass in a hash ('product')
    puts "<h2>#{product['name']}</h2>"
    puts "<img src='#{product['image_url']}'>"
    puts "  <p>Id: #{product['id']}</p>"
    puts "  <p>#{product['producer_name']}</p>"
    puts "  <p>#{product['primary_category']}</p>"
    puts "  <p>#{product['secondary_category']}</p>"
    puts "  <p>#{product['package_unit_volume_in_milliliters']} ml</p>"
    puts "  <p>$#{product['price_in_cents'].to_f/100}</p>"
  end

  def display_detailed_product(product)   #we pass in a hash ('product')
    puts "<h2>#{product['name']}</h2>"
    puts "<img src='#{product['image_url']}'>"
    puts "<div style='float: right'>"
    puts "  <p>Id: #{product['id']}</p>"
    puts "  <p>#{product['producer_name']}</p>"
    puts "  <p>#{product['primary_category']}</p>"
    puts "  <p>#{product['secondary_category']}</p>"
    puts "  <p>#{product['package_unit_volume_in_milliliters']} ml</p>"
    puts "  <p>$#{product['price_in_cents'].to_f/100}</p>"
    puts "  <p>#{product['package_unit_type'].capitalize}</p>"
    puts "  <p>#{product['package']}</p>"
    puts "  <p>#{product['sugar_content']}</p>"
    puts "  <p>#{product['origin']}</p>"
    puts "  <p>#{product['updated_at']}</p>"
    puts "  <p>#{product['tags']}</p>"
    puts "  <p>#{product['description']}</p>"
    puts "  <p>#{product['tasting_note']}</p>"
    puts "</div>"
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

  def retrieve_data(url)
    response = open(url).read
    data = JSON.parse(response)
    return data["result"]
  end

end