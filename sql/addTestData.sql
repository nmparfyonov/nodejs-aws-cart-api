INSERT INTO carts (id, user_id, created_at, updated_at, status)
VALUES
    ('11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', '2023-01-01', '2023-01-01', 'OPEN'),
    ('22222222-2222-2222-2222-222222222222', '33333333-3333-3333-3333-333333333333', '2023-02-01', '2023-02-01', 'ORDERED');

INSERT INTO cart_items (cart_id, product_id, count)
VALUES
    ('11111111-1111-1111-1111-111111111111', '12345678-1234-5678-9876-123456789012', 3),
    ('11111111-1111-1111-1111-111111111111', '87654321-4321-8765-5678-210987654321', 2),
    ('22222222-2222-2222-2222-222222222222', '98765432-7654-4321-2345-678901234567', 1);

INSERT INTO orders (id, user_id, cart_id, payment, delivery, comments, status, total)
VALUES
    ('33333333-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', '{"method": "credit_card", "amount": 50.00}', '{"address": "123 Main St", "city": "Cityville", "zip": "12345"}', 'Fast delivery preferred', 'PENDING', 50.00),
    ('44444444-4444-4444-4444-444444444444', '55555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', '{"method": "paypal", "amount": 75.50}', '{"address": "456 Oak St", "city": "Townsville", "zip": "54321"}', 'Handle with care', 'PROCESSING', 75.50);