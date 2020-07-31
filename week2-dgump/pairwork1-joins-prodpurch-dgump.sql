-- Pair work 1
-- 7-30

-- Write a query that joins the purchase_items and product tables. 
-- The query should return the purchase ID, title, quantity, and price 
-- fields for all returned laptop computers.
SELECT purchase_id, prod.title, pur.quantity, pur.price, state
FROM purchase_items pur
	JOIN products prod
		ON pur.product_id = prod.id
WHERE prod.title = 'Laptop Computer'
	  AND state = 'Returned';

-- SELECT title FROM products
-- WHERE title ILIKE '%lap%top%'

-- Write a query that joins all 4 tables in the database and returns all 
-- MP3 Player purchase line items that are in pending status and were ordered 
-- from the state of Florida (FL) by email address Derek.Knittel@gmail.com. 
-- The query should return the purchase ID, the order status, the customer name, 
-- the state, the product name, the order quantity, the order price, and the customer email.
SELECT pur.id as pur_id, pur.state as status, pur.name as name, items.quantity, items.price, users.email, prod.title
FROM products prod
	JOIN purchase_items items
		ON prod.id = items.product_id
	JOIN purchases pur
		ON items.purchase_id = pur.id
	JOIN users
		ON pur.user_id = users.id
WHERE prod.title = 'MP3 Player'
	  AND items.state = 'Pending'
 	  AND pur.state = 'FL'
 	  AND email = 'Derek.Knittel@gmail.com'
	
-- SELECT email FROM users




