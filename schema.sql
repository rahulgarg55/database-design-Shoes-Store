 TABLE Products(
  product_id INT,
  description VARCHAR(100),
  colors VARCHAR(50),
  size ENUM('6','7','8','9','10'),
  brand VARCHAR(50),
  category VARCHAR(50),
  gender VARCHAR(20),
  style VARCHAR(50),
  stock_quantity INT,
  brand_id INT,
  PRIMARY KEY (product_id),
  FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);


Table Users{
  user_id int PRIMARY KEY,
  name varchar(50),
  email varchar(100),
  password varchar(100),
  registration_date datetime
}

Table Wishlists{
  Wishlist_id int PRIMARY KEY,
  user_id int,
  product_id int,
  added_at datetime,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
}

Table brands{
  brand_id int PRIMARY KEY,
  brand_name varchar(50) UNIQUE,
  brand_type varchar(50),
  founding_year int,
  description varchar(255),
  logo_url varchar(255)
}

Table categories{
  category_id int PRIMARY KEY,
  category_name varchar(50) UNIQUE,
  category_description varchar(100)
}

Table orders{
  order_id int PRIMARY KEY,
  user_id int,
  added_at datetime,
  total_amount decimal(10,2),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
}

Table order_items{
  item_id int PRIMARY KEY,
  order_id int,
  product_id int,
  quantity int,
  price decimal(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
}

Table reviews{
  review_id int PRIMARY KEY,
  user_id int,
  product_id int,
  rating int,
  comment varchar(255),
  review_date datetime,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
}

Table customers{
  customer_id int PRIMARY KEY,
  customer_name varchar(50),
  customer_email varchar(100),
  customer_address varchar(50),
  customer_phonenumber varchar(20)
}

Table carts{
  cart_id int,
  customer_id int,
  quantity int,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
}

Table Payments{
  payment_id int,
  customer_id int,
  payment_method varchar(50),
  card_number integer,
  expiration_date varchar(10),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
}

Table shipping{
  shipping_id int,
  order_id int,
  customer_id int,
  shipping_address varchar(100),
  shipping_method varchar(50),
  tracking_number varchar(50),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
}

Table Promotions{
  promotion_id int,
  name varchar(50),
  description varchar(255),
  start_date datetime, -- Use "datetime" data type instead of "date" or "timestamp"
  end_date datetime, -- Use "datetime" data type instead of "date" or "timestamp"
  date int, -- This column name might need to be revised as it's not clear what it represents
  discount_percentage int
}

Table Productimages{
  image_id int PRIMARY KEY,
  product_id int,
  price decimal(10,2),
  image_url varchar(255),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
}
