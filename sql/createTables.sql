CREATE TYPE cart_statuses AS ENUM ('OPEN', 'ORDERED');
CREATE TABLE carts (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    status cart_statuses NOT NULL
);

CREATE TABLE cart_items (
    cart_id UUID REFERENCES carts(id),
    product_id UUID,
    count INTEGER,
    PRIMARY KEY (cart_id, product_id)
);

CREATE TYPE order_statuses AS ENUM ('PENDING', 'PROCESSING', 'SHIPPED', 'DELIVERED');
CREATE TABLE orders (
    id UUID PRIMARY KEY,
    user_id UUID,
    cart_id UUID REFERENCES carts(id),
    payment JSON,
    delivery JSON,
    comments TEXT,
    status order_statuses NOT NULL,
    total NUMERIC NOT NULL
);