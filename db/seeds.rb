
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

ua_shoes = Clothing.create(name: "Under Armour Curry 6s", material: "Polyester", price: 129.99, brand_id: ua.id, article_id: shoes.id)
ua_shirts = Clothing.create(name: "Under Armour Compression Shirts", material: "Nylon", price: 34.99, brand_id: ua.id, article_id: shirts.id)
ua_pants = Clothing.create(name: "Under Armour Basketball Shorts", material: "Nylon", price: 49.99, brand_id: ua.id, article_id: pants.id)
adidas_shoes = Clothing.create(name: "Adidas Ultra Boosts", material: "Cotton", price: 179.99, brand_id: adidas.id, article_id: shoes.id)
adidas_shirts = Clothing.create(name: "Adidas Short Sleeve Shirts", material: "Cotton", price: 39.99, brand_id: adidas.id, article_id: shirts.id)
adidas_pants = Clothing.create(name: "Adidas Track Pants", material: "Polyester", price: 44.99, brand_id: adidas.id, article_id: pants.id)
nike_shoes = Clothing.create(name: "Nike Flyknits", material: "Cotton", price: 104.99, brand_id: nike.id, article_id: shoes.id)
nike_hoodie = Clothing.create(name: "Nike Tech Fleece Hoodies", material: "Cotton", price: 99.99, brand_id: nike.id, article_id: shirts.id)
nike_pants = Clothing.create(name: "Nike Sweatpants", material: "Polyester", price: 45.99, brand_id: nike.id, article_id: pants.id)
reebok_shoes = Clothing.create(name: "Reebok Classic Leathers", material: "Leather", price: 24.99, brand_id: reebok.id, article_id: shoes.id)
reebok_shirts = Clothing.create(name: "Reebok V-neck Tees", material: "Cotton", price: 22.99, brand_id: reebok.id, article_id: shirts.id)
reebok_pants = Clothing.create(name: "Reebok Sleeping Pants", material: "Cotton", price: 34.99, brand_id: reebok.id, article_id: pants.id)

ua_shoes1 = Clothing.create(name: "Under Armour Lockdown 3s", material: "Polyester", price: 59.45, brand_id: ua.id, article_id: shoes.id)
ua_shirts1 = Clothing.create(name: "Under Armour Oversized Tees", material: "Nylon", price: 44.45, brand_id: ua.id, article_id: shirts.id)
ua_pants1 = Clothing.create(name: "Under Armour Running Shorts", material: "Nylon", price: 24.45, brand_id: ua.id, article_id: pants.id)
adidas_shoes1 = Clothing.create(name: "Adidas Squatting Shoes", material: "Cotton", price: 99.45, brand_id: adidas.id, article_id: shoes.id)
adidas_shirts1 = Clothing.create(name: "Adidas Long Sleeve Shirts", material: "Cotton", price: 29.45, brand_id: adidas.id, article_id: shirts.id)
adidas_pants1 = Clothing.create(name: "Adidas Soccer Pants", material: "Polyester", price: 32.45, brand_id: adidas.id, article_id: pants.id)
nike_shoes1 = Clothing.create(name: "Nike Air Maxes", material: "Cotton", price: 115.45, brand_id: nike.id, article_id: shoes.id)
nike_hoodie1 = Clothing.create(name: "Nike Sports Hoodies", material: "Cotton", price: 98.45, brand_id: nike.id, article_id: shirts.id)
nike_pants1 = Clothing.create(name: "Nike Flex Sweatpants", material: "Polyester", price: 33.45, brand_id: nike.id, article_id: pants.id)
reebok_shoes1 = Clothing.create(name: "Reebok Running Shoes", material: "Leather", price: 21.45, brand_id: reebok.id, article_id: shoes.id)
reebok_shirts1 = Clothing.create(name: "Reebok Crewneck Tees", material: "Polyester", price: 21.45, brand_id: reebok.id, article_id: shirts.id)
reebok_pants1 = Clothing.create(name: "Reebok Sweatpants", material: "Nylon", price: 44.45, brand_id: reebok.id, article_id: pants.id)
