# Clear old data
Category.destroy_all
Product.destroy_all

# Create categories and store references
categories = {}
%w[Clothing Accessories Beauty Footwear].each do |name|
  categories[name] = Category.create!(name: name)
end

# Create 10 real products with spread-out categories
Product.create!([
  #  Clothing (4)
  {
    name: "Classic Denim Jacket",
    description: "A timeless blue denim jacket with a button-up front and adjustable cuffs. Perfect for layering year-round.",
    price: 59.99,
    category: categories["Clothing"]
  },
  {
    name: "Floral Maxi Dress",
    description: "A lightweight, floor-length dress with a pastel floral print and flowy silhouette. Ideal for spring and summer events.",
    price: 74.99,
    category: categories["Clothing"]
  },
  {
    name: "High-Waisted Black Jeans",
    description: "Stylish and versatile black denim jeans featuring a flattering high-rise fit and stretch fabric.",
    price: 49.99,
    category: categories["Clothing"]
  },
  {
    name: "Ribbed Tank Top",
    description: "Basic white ribbed tank made from breathable cotton. A must-have layering piece for any season.",
    price: 19.99,
    category: categories["Clothing"]
  },

  #  Accessories (2)
  {
    name: "Faux Leather Moto Jacket",
    description: "Edgy black faux leather jacket with zipper details and a cropped cut. A wardrobe essential for bold looks.",
    price: 89.99,
    category: categories["Accessories"]
  },
  {
    name: "Oversized Flannel Shirt",
    description: "Red and black plaid flannel shirt with an oversized fit. Perfect for casual days or worn as a light jacket.",
    price: 29.99,
    category: categories["Accessories"]
  },

  #  Footwear (2)
  {
    name: "White Chunky Sneakers",
    description: "Trendy white sneakers with a chunky sole. Ideal for casual streetwear or athleisure looks.",
    price: 64.99,
    category: categories["Footwear"]
  },
  {
    name: "Black Ankle Boots",
    description: "Classic ankle boots with a low block heel. Great for pairing with jeans, skirts, or dresses.",
    price: 84.99,
    category: categories["Footwear"]
  },

  #  Beauty (2)
  {
    name: "Matte Liquid Lipstick",
    description: "Long-lasting matte lipstick in a warm nude shade. Lightweight and non-drying formula.",
    price: 14.99,
    category: categories["Beauty"]
  },
  {
    name: "Hydrating Face Mist",
    description: "Refreshing facial mist infused with rose water and aloe. Provides instant hydration and glow.",
    price: 12.99,
    category: categories["Beauty"]
  }
])

puts " Seeded 10 products across 4 categories."

# Create admin user if not already there
AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
) unless AdminUser.exists?(email: 'admin@example.com')
