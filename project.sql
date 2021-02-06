CREATE TABLE customers
(customer_id NUMBER(10,0) CONSTRAINT ctr_customer_id_nn NOT NULL,
 last_name VARCHAR2(25) CONSTRAINT ctr_last_name_nn NOT NULL,
 first_name VARCHAR2(25) CONSTRAINT ctr_first_name_nn NOT NULL,
 home_phone VARCHAR2(12),
 address VARCHAR2(100) CONSTRAINT ctr_address_nn NOT NULL,
 city VARCHAR2(30) CONSTRAINT ctr_city_nn NOT NULL,
 state VARCHAR2(2) CONSTRAINT ctr_state_nn NOT NULL,
 email VARCHAR2(25),
 cell_phone VARCHAR2(12),
 CONSTRAINT ctr_customer_id_pk PRIMARY KEY (customer_id)
);

CREATE TABLE movies
(title_id NUMBER(10,0) CONSTRAINT mie_title_id_nn NOT NULL,
 title VARCHAR2(60) CONSTRAINT mie_title_nn NOT NULL,
 description VARCHAR2(400) CONSTRAINT mie_description_nn NOT NULL,
 rating VARCHAR2(4),
 category VARCHAR2(20),
 release_date DATE,
 CONSTRAINT mie_title_id_pk PRIMARY KEY (title_id),
 CONSTRAINT mie_rating_ck CHECK (rating IN('G', 'PG', 'PG13', 'NC17', 'M', 'R')),
 CONSTRAINT mie_category_ck CHECK (category IN('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI', 'DOCUMENTARY', 'ROMCOM', 'WESTERN'))
);