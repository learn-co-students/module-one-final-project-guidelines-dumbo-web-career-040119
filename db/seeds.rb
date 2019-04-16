
Clothing.destroy_all
Brand.destroy_all
Article.destroy_all



nike = Brand.create(name: "Nike", pricepoint: "luxury")
adidas = Brand.create(name: "Adidas", pricepoint: "luxury")
ua = Brand.create(name: "Under Armour", pricepoint: "budget")
reebok = Brand.create(name: "Reebok", pricepoint: "budget")

shoes = Article.create(slot: "Shoes")
shirts = Article.create(slot: "Shirts")
pants = Article.create(slot: "Pants")

ua_shoes = Clothing.create(name: "Curry", material: "Polyester", price: 130.00, brand_id: ua.id, article_id: shoes.id)
ua_shirts = Clothing.create(name: "Compression", material: "Nylon", price: 35.00, brand_id: ua.id, article_id: shirts.id)
ua_pants = Clothing.create(name: "shorts", material: "Nylon", price: 50.00, brand_id: ua.id, article_id: pants.id)
adidas_shoes = Clothing.create(name: "Ultra Boost", material: "Cotton", price: 180.00, brand_id: adidas.id, article_id: shoes.id)
adidas_shirts = Clothing.create(name: "Three Stripes", material: "Cotton", price: 39.90, brand_id: adidas.id, article_id: shirts.id)
adidas_pants = Clothing.create(name: "Track", material: "Polyester", price: 44.99, brand_id: adidas.id, article_id: pants.id)
nike_shoes = Clothing.create(name: "Flyknits", material: "Cotton", price: 105.00, brand_id: nike.id, article_id: pants.id)
nike_hoodie = Clothing.create(name: "Tech Fleece", material: "Cotton", price: 99.00, brand_id: nike.id, article_id: shirts.id)
nike_pants = Clothing.create(name: "Sweatpants", material: "Polyester", price: 45.50, brand_id: nike.id, article_id: pants.id)
reebok_shoes = Clothing.create(name: "Britains", material: "Leather", price: 25.00, brand_id: reebok.id, article_id: shoes.id)
