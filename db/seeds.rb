

ua_shoes = Clothing.create(name: "Curry", material: "Polyester", price: 130.00)
ua_shirts = Clothing.create(name: "Compression", material: "Nylon", price: 35.00)
ua_pants = Clothing.create(name: "shorts", material: "Nylon", price: 50.00)
adidas_shoes = Clothing.create(name: "Ultra Boost", material: "Cotton", price: 180.00)
adidas_shirts = Clothing.create(name: "Three Stripes", material: "Cotton", price: 39.90)
adidas_pants = Clothing.create(name: "Track", material: "Polyester", price: 44.99)
nike_shoes = Clothing.create(name: "Flyknits", material: "Cotton", price: 105.00)
nike_hoodie = Clothing.create(name: "Tech Fleece", material: "Cotton", price: 99.00)
nike_pants = Clothing.create(name: "Sweatpants", material: "Polyester", price: 45.50)

nike = Brand.create(name: "Nike", pricepoint: "luxury")
adidas = Brand.create(name: "Adidas", pricepoint: "luxury")
ua = Brand.create(name: "Under Armour", pricepoint: "budget")

shoes = Aritcle.create(name: "Shoes")
shirts = Article.create(name: "Shirts")
pants = Article.create(name: "Pants")
