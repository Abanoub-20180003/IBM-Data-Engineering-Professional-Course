BEGIN;


CREATE TABLE public.sales_transactions
(
    transaction_id integer NOT NULL,
    transaction_date date NOT NULL,
    transaction_time date NOT NULL,
    PRIMARY KEY (transaction_id)
);

CREATE TABLE public.product
(
    product_id integer NOT NULL,
    "product_name " character varying(35) NOT NULL,
    description character varying(100) NOT NULL,
    price double precision NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE public.sales_detail
(
    product_id integer NOT NULL,
    transaction_id integer NOT NULL,
    sales_outlet_id integer NOT NULL,
    staff_id integer NOT NULL,
    customer_id integer NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL
);

CREATE TABLE public.product_type
(
    product_category character varying(25) NOT NULL,
    type character varying(25) NOT NULL,
    product_id integer NOT NULL
);

ALTER TABLE public.sales_detail
    ADD FOREIGN KEY (transaction_id)
    REFERENCES public.sales_transactions (transaction_id)
    NOT VALID;


ALTER TABLE public.sales_detail
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product (product_id)
    NOT VALID;


ALTER TABLE public.product
    ADD FOREIGN KEY (product_id)
    REFERENCES public.product_type (product_id)
    NOT VALID;

END;