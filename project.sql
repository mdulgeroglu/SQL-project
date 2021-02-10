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
 CONSTRAINT mie_category_ck CHECK (category IN('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI', 'DOCU', 'ROMCOM', 'WESTERN'))
);

CREATE TABLE media
(media_id NUMBER(10,0) CONSTRAINT mda_media_id_nn NOT NULL,
 format VARCHAR2(3) CONSTRAINT mda_format_nn NOT NULL,
 title_id NUMBER(10,0) CONSTRAINT mda_title_id_nn NOT NULL,
 CONSTRAINT mda_media_id_pk PRIMARY KEY (media_id),
 CONSTRAINT mda_title_id_fk FOREIGN KEY (title_id)
    REFERENCES movies (title_id)
);

CREATE TABLE rental_history
(media_id NUMBER(10,0) CONSTRAINT rhy_media_id_nn NOT NULL,
 rental_date DATE DEFAULT SYSDATE CONSTRAINT rhy_rental_date_nn NOT NULL,
 customer_id NUMBER(10,0) CONSTRAINT rhy_customer_id_nn NOT NULL,
 return_date,
 CONSTRAINT rhy_media_id_rental_date_pk PRIMARY KEY (media_id, rental_date),
 CONSTRAINT rhy_media_id_fk FOREIGN KEY (media_id)
    REFERENCES media (media_id),
 CONSTRAINT rhy_customer_id_fk FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
);

CREATE TABLE actors
(actor_id NUMBER(10,0) CONSTRAINT atr_actor_id_nn NOT NULL,
 stage_name VARCHAR2(40),
 first_name VARCHAR2(25) CONSTRAINT atr_first_name_nn NOT NULL,
 last_name VARCHAR2(25) CONSTRAINT atr_last_name_nn NOT NULL,
 birth_date DATE CONSTRAINT atr_birth_date_nn NOT NULL,
 CONSTRAINT atr_actor_id_pk PRIMARY KEY (actor_id)
);

CREATE TABLE roles
(actor_id NUMBER(10,0) CONSTRAINT rls_actor_id_nn NOT NULL,
 title_id NUMBER(10,0) CONSTRAINT rls_title_id_nn NOT NULL,
 comments VARCHAR2(40),
);