Table brands {
  brand_id int [primary key]
  brand_name varchar(50) [unique]
  brand_type varchar(50)
  founding_year int
  description varchar(255)
  logo_url varchar(255)
}

Table categories {
  category_id int [primary key]
  category_name varchar(50) [unique]
  category_description varchar(100)
}

Table users {
  user_id int [primary key]
  name varchar(50)
  email varchar(100)
  password varchar(100)
  registration_date datetime
}

Table products {
  product_id int [primary key]
  description varchar(100)
  colors varchar(50)
  size enum('6','7','8','9','10')
  brand_id int [ref: > brands.brand_id]
  category_id int [ref: > categories.category_id]
  gender varchar(20)
  style varchar(50)
  stock_quantity int
}

Table wishlists {
  wishlist_id int [primary key]
  user_id int [ref: > users.user_id]
  product_id int [ref: > products.product_id]
  added_at datetime
}

Table orders {
  order_id int [primary key]
  user_id int [ref: > users.user_id]
  added_at datetime
  total_amount decimal(10,2)
}

Table order_items {
  item_id int [primary key]
  order_id int [ref: > orders.order_id]
  product_id int [ref: > products.product_id]
  quantity int
  price decimal(10,2)
}

Table reviews {
  review_id int [primary key]
  user_id int [ref: > users.user_id]
  product_id int [ref: > products.product_id]
  rating int
  comment varchar(255)
  review_date datetime
}

Table customers {
  customer_id int [primary key]
  customer_name varchar(50)
  customer_email varchar(100)
  customer_address varchar(50)
  customer_phonenumber varchar(20)
}

Table carts {
  cart_id int
  customer_id int [ref: > customers.customer_id]
  quantity int
}

Table payments {
  payment_id int
  customer_id int [ref: > customers.customer_id]
  payment_method varchar(50)
  card_number int(20)
  expiration_date varchar(10)
}

Table shipping {
  shipping_id int
  order_id int [ref: > orders.order_id]
  customer_id int [ref: > customers.customer_id]
  shipping_address varchar(100)
  shipping_method varchar(50)
  tracking_number varchar(50)
}
