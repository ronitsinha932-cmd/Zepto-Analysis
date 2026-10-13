DROP TABLE IF EXISTS zepto;
CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(150),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8, 2),
    discountpercentage NUMERIC(5, 2),
    available_quantity INTEGER,
    discounted_selling_price NUMERIC(8, 2),
    weight_in_gram INTEGER,
    out_of_stock BOOLEAN,
    quantity INTEGER
);