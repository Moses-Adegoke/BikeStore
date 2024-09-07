SELECT
	Ord.Order_id,
	CONCAT(cus.first_name, ' ',cus.last_name)  Customer_Names,
	Cus.City,
	Cus.State,
	ord.Order_date,
	SUM(Ite.quantity) Total_Units,
	SUM(Ite.quantity*Ite.list_price) Revenue,
	Product_name,
	 Cat.Category_name,
	 Brand_name,
	 Store_name,
	 CONCAT(sta.first_name, ' ',sta.last_name) Sales_Rep
FROM sales.orders Ord
JOIN sales.customers Cus
ON Ord.customer_id=Cus.customer_id
JOIN sales.stores Sto
ON ord.store_id=sto.store_id
JOIN sales.order_items Ite
ON Ord.order_id=Ite.order_id
JOIN production.products Pro
ON Ite.product_id=Pro.product_id
JOIN production.brands Bra
ON pro.brand_id=bra.brand_id
JOIN production.categories Cat
ON pro.category_id=cat.category_id
JOIN sales.staffs sta
ON ord.staff_id=sta.staff_id
GROUP BY 
	Ord.Order_id,
	CONCAT(cus.first_name, ' ',cus.last_name),
	Cus.City,
	Cus.State,
	ord.Order_date,
	Product_name,
	cat.category_name,
	bra.Brand_name,
	store_name,
	CONCAT(sta.first_name, ' ',sta.last_name)