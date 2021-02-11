/* Creating tables*/

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
 CONSTRAINT rls_actor_id_title_id_pk PRIMARY KEY (actor_id, title_id),
 CONSTRAINT rls_actor_id_fk FOREIGN KEY (actor_id)
    REFERENCES actors (actor_id),
 CONSTRAINT rls_title_id_fk FOREIGN KEY (title_id)
    REFERENCES movies (title_id)
);


/* Creating sequences*/

CREATE SEQUENCE customer_id_seq
    INCREMENT BY 1
    START WITH 101
    MAXVALUE 1000
    NOCACHE
    NOCYCLE;
    
CREATE SEQUENCE title_id_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 1000
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE media_id_seq
    INCREMENT BY 1
    START WITH 92
    MAXVALUE 1000
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE actor_id_seq
    INCREMENT BY 1
    START WITH 1001
    MAXVALUE 2000
    NOCACHE
    NOCYCLE;


/* Inserting sample values into MOVIES */

INSERT ALL
   INTO movies (title_id, title, description, rating, category, release_date) 
     VALUES (title_id_seq.NEXTVAL, 'The Grinch', 'A grumpy Grinch (Benedict Cumberbatch) plots to ruin Christmas for the village of Whoville.', 'PG', 'COMEDY', TO_DATE('9-Nov-2018', 'DD-Mon-YYYY'))
   INTO movies (title_id, title, description, rating, category, release_date) 
     VALUES (title_id_seq.NEXTVAL, 'Blade Runner 2049', 'Young Blade Runner Ks discovery of a long-buried secret leads him to track down former Blade Runner Rick Deckard, whos been missing for thirty years.', 'R', 'ACTION', TO_DATE('6-Oct-2017', 'DD-Mon-YYYY'))
   INTO movies (title_id, title, description, rating, category, release_date) 
     VALUES (title_id_seq.NEXTVAL, 'Glass', 'Security guard David Dunn uses his supernatural abilities to track Kevin Wendell Crumb, a disturbed man who has twenty-four personalities.', 'PG13', 'DRAMA', TO_DATE('18-Jan-2019', 'DD-Mon-YYYY'))
   INTO movies (title_id, title, description, rating, category, release_date) 
     VALUES (title_id_seq.NEXTVAL, 'Shazam!', 'A newly fostered young boy in search of his mother instead finds unexpected super powers and soon gains a powerful enemy. ', 'PG13', 'ACTION', TO_DATE('5-Apr-2019', 'DD-Mon-YYYY'))
   INTO movies (title_id, title, description, rating, category, release_date) 
     VALUES (title_id_seq.NEXTVAL, 'Pokémon Detective Pikachu', 'In a world where people collect Pokémon to do battle, a boy comes across an intelligent talking Pikachu who seeks to be a detective. ', 'PG', 'ACTION', TO_DATE('10-May-2019', 'DD-Mon-YYYY'))
SELECT * FROM DUAL; 
   