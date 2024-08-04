
-- Create Customer Table
IF NOT EXISTS (
	CREATE TABLE "Customers" (
		"id" INTEGER NOT NULL UNIQUE,
		"first_name" VARCHAR,
		"middle_name" VARCHAR,
		"last_name" VARCHAR,
		"phone" INTEGER,
		"email" VARCHAR,
		"address_01" VARCHAR,
		"address_02" VARCHAR,
		"postal_code" VARCHAR,
		PRIMARY KEY("id")
))
-- COMMENT ON TABLE "Customers" IS 'Customer Data';

-- Create Employees Table
CREATE TABLE "Employees" (
	"id" INTEGER NOT NULL UNIQUE,
	"first_name" VARCHAR NOT NULL,
	"middle_name" VARCHAR NOT NULL,
	"last_name" VARCHAR NOT NULL,
	"phone" VARCHAR NOT NULL,
	"email" VARCHAR NOT NULL,
	"store_id" INTEGER NOT NULL,
	"address" VARCHAR,
	"county" VARCHAR,
	"city" VARCHAR,
	"country" VARCHAR,
	"postal_code" VARCHAR,
	PRIMARY KEY("id")
);


CREATE TABLE "Partners" (
	"id" INTEGER NOT NULL UNIQUE,
	"business_name" VARCHAR,
	"owner_first_name" VARCHAR,
	"owner_last_name" VARCHAR,
	"phone" VARCHAR,
	"email" VARCHAR,
	PRIMARY KEY("id")
);


CREATE TABLE "Stores" (
	"id" INTEGER NOT NULL UNIQUE,
	"name" VARCHAR NOT NULL,
	"phone" VARCHAR NOT NULL,
	"email" VARCHAR NOT NULL,
	"postal_code" VARCHAR NOT NULL,
	"county" VARCHAR NOT NULL,
	"partner_id" INTEGER NOT NULL,
	"description" VARCHAR,
	"address_01" VARCHAR NOT NULL,
	"address_02" VARCHAR NOT NULL,
	"country" VARCHAR NOT NULL,
	PRIMARY KEY("id")
);


CREATE TABLE "Orders" (
	"id" INTEGER NOT NULL UNIQUE,
	"customer_id" INTEGER NOT NULL,
	"store_id" INTEGER NOT NULL,
	"product_id" INTEGER NOT NULL,
	"order_datetime" TIMESTAMP NOT NULL,
	"rental_start_datetime" VARCHAR ,
	"rental_end_date" VARCHAR,
	"rental_actual_end_date" VARCHAR,
	"rental_duration_expect" VARCHAR,
	"rental_duration_actual" VARCHAR,
	PRIMARY KEY("id")
);


CREATE TABLE "Products" (
	"id" INTEGER NOT NULL UNIQUE,
	"name" VARCHAR NOT NULL,
	"make" VARCHAR NOT NULL,
	"model" VARCHAR NOT NULL,
	"pg_L01" INTEGER NOT NULL,
	"pg_L02" INTEGER NOT NULL,
	PRIMARY KEY("id")
);


CREATE TABLE "Maintenance" (
	"id" INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id")
);


CREATE TABLE "Product_Groups_L01" (
	"id" INTEGER NOT NULL UNIQUE,
	"name" VARCHAR NOT NULL,
	"description" VARCHAR,
	PRIMARY KEY("id")
);


CREATE TABLE "Vendors" (
	"id" INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id")
);


CREATE TABLE "Product_Groups_L02" (
	"id" INTEGER NOT NULL UNIQUE,
	"name" VARCHAR NOT NULL,
	"description" VARCHAR NOT NULL,
	PRIMARY KEY("id")
);


ALTER TABLE "Partners"
ADD FOREIGN KEY("id") REFERENCES "Stores"("partner_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Customers"
ADD FOREIGN KEY("id") REFERENCES "Orders"("customer_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Stores"
ADD FOREIGN KEY("id") REFERENCES "Orders"("store_id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Orders"
ADD FOREIGN KEY("product_id") REFERENCES "Products"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Employees"
ADD FOREIGN KEY("store_id") REFERENCES "Stores"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;