CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price FLOAT,
    picture_url VARCHAR(255)
);
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    status VARCHAR(255),
    date_created DATE DEFAULT CURRENT_DATE
);
CREATE TABLE order_product (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES product(id),
    quantity INTEGER NOT NULL
);
