product_ids = (1..30).to_a
product_names = ("1".."30").to_a
category_names = [*1..18,*1..12]
array_number = 0

product_ids.each do 
  Product.create(
    name: product_names[array_number],
    price: product_ids[array_number],
    description: product_names[array_number],
    category_id: category_names[array_number]
  )
  array_number += 1
end