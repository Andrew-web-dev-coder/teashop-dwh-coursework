-- Table: public.suppliers

-- DROP TABLE IF EXISTS public.suppliers;

CREATE TABLE IF NOT EXISTS public.suppliers
(
    supplier_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    country text COLLATE pg_catalog."default",
    contact_email text COLLATE pg_catalog."default",
    phone text COLLATE pg_catalog."default",
    CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.suppliers
    OWNER to postgres;

-- Table: public.products

-- DROP TABLE IF EXISTS public.products;

CREATE TABLE IF NOT EXISTS public.products
(
    product_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    price_per_unit numeric(10,2),
    weight_g integer,
    supplier_code character varying(10) COLLATE pg_catalog."default",
    category_code character varying(5) COLLATE pg_catalog."default",
    CONSTRAINT products_pkey PRIMARY KEY (product_code),
    CONSTRAINT products_supplier_code_fkey FOREIGN KEY (supplier_code)
        REFERENCES public.suppliers (supplier_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT products_category_code_check CHECK (category_code::text = ANY (ARRAY['TEA'::character varying, 'COF'::character varying, 'SPI'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.products
    OWNER to postgres;

-- Table: public.customers

-- DROP TABLE IF EXISTS public.customers;

CREATE TABLE IF NOT EXISTS public.customers
(
    customer_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    email text COLLATE pg_catalog."default",
    phone text COLLATE pg_catalog."default",
    address text COLLATE pg_catalog."default",
    CONSTRAINT customers_pkey PRIMARY KEY (customer_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;

-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    order_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    customer_code character varying(10) COLLATE pg_catalog."default",
    order_date date,
    status text COLLATE pg_catalog."default",
    total_amount numeric(10,2),
    CONSTRAINT orders_pkey PRIMARY KEY (order_code),
    CONSTRAINT orders_customer_code_fkey FOREIGN KEY (customer_code)
        REFERENCES public.customers (customer_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT orders_status_check CHECK (status = ANY (ARRAY['COMPLETED'::text, 'PENDING'::text, 'CANCELLED'::text]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;

-- Table: public.blends

-- DROP TABLE IF EXISTS public.blends;

CREATE TABLE IF NOT EXISTS public.blends
(
    blend_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    base_product_code character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT blends_pkey PRIMARY KEY (blend_code),
    CONSTRAINT blends_base_product_code_fkey FOREIGN KEY (base_product_code)
        REFERENCES public.products (product_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.blends
    OWNER to postgres;

-- Table: public.tasting_notes

-- DROP TABLE IF EXISTS public.tasting_notes;

CREATE TABLE IF NOT EXISTS public.tasting_notes
(
    note_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    product_code character varying(10) COLLATE pg_catalog."default",
    author text COLLATE pg_catalog."default",
    rating integer,
    note_text text COLLATE pg_catalog."default",
    date date,
    CONSTRAINT tasting_notes_pkey PRIMARY KEY (note_code),
    CONSTRAINT tasting_notes_product_code_fkey FOREIGN KEY (product_code)
        REFERENCES public.products (product_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT tasting_notes_rating_check CHECK (rating >= 1 AND rating <= 5)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tasting_notes
    OWNER to postgres;

-- Table: public.warehouse

-- DROP TABLE IF EXISTS public.warehouse;

CREATE TABLE IF NOT EXISTS public.warehouse
(
    product_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    current_stock integer,
    last_restock_date date,
    CONSTRAINT warehouse_pkey PRIMARY KEY (product_code),
    CONSTRAINT warehouse_product_code_fkey FOREIGN KEY (product_code)
        REFERENCES public.products (product_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.warehouse
    OWNER to postgres;

-- Table: public.order_items

-- DROP TABLE IF EXISTS public.order_items;

CREATE TABLE IF NOT EXISTS public.order_items
(
    item_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    order_code character varying(10) COLLATE pg_catalog."default",
    product_code character varying(10) COLLATE pg_catalog."default",
    quantity integer,
    price_at_purchase numeric(10,2),
    CONSTRAINT order_items_pkey PRIMARY KEY (item_code),
    CONSTRAINT order_items_order_code_fkey FOREIGN KEY (order_code)
        REFERENCES public.orders (order_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT order_items_product_code_fkey FOREIGN KEY (product_code)
        REFERENCES public.products (product_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_items
    OWNER to postgres;
