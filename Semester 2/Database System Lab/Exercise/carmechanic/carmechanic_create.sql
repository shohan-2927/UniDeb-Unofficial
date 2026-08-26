


DROP TABLE m_car CASCADE CONSTRAINTS;

DROP TABLE m_car_evaluation CASCADE CONSTRAINTS;

DROP TABLE m_car_make CASCADE CONSTRAINTS;

DROP TABLE m_car_model CASCADE CONSTRAINTS;

DROP TABLE m_mechanic CASCADE CONSTRAINTS;

DROP TABLE m_owner CASCADE CONSTRAINTS;

DROP TABLE m_owns CASCADE CONSTRAINTS;

DROP TABLE m_repair CASCADE CONSTRAINTS;

DROP TABLE m_works_for CASCADE CONSTRAINTS;

DROP TABLE m_workshop CASCADE CONSTRAINTS;

CREATE TABLE m_car (
    c_id                   NUMBER(5) NOT NULL,
    color                  VARCHAR2(20 CHAR),
    first_sell_date        DATE,
    first_sell_price       NUMBER(20),
    model_id               NUMBER(5),
    license_plate_number   VARCHAR2(10 CHAR) NOT NULL
);


ALTER TABLE m_car
    ADD CONSTRAINT m_c_pk PRIMARY KEY ( c_id );

ALTER TABLE m_car
    ADD CONSTRAINT m_c_un UNIQUE ( license_plate_number );

CREATE TABLE m_car_evaluation (
    car_id           NUMBER(5) NOT NULL,
    evaluation_date  DATE NOT NULL,
    price            NUMBER(20) NOT NULL
);

ALTER TABLE m_car_evaluation
    ADD CONSTRAINT m_ce_pk PRIMARY KEY ( evaluation_date,
                                         car_id );

CREATE TABLE m_car_make (
    brand VARCHAR2(20 CHAR) NOT NULL
);



ALTER TABLE m_car_make
    ADD CONSTRAINT m_cma_pk PRIMARY KEY ( brand );

CREATE TABLE m_car_model (
    cm_id     NUMBER(5) NOT NULL,
    cm_name   VARCHAR2(20 CHAR) NOT NULL,
    make      VARCHAR2(20 CHAR) NOT NULL,
    details   VARCHAR2(100 CHAR)
);


ALTER TABLE m_car_model
    ADD CONSTRAINT m_cmo_pk PRIMARY KEY ( cm_id );

CREATE TABLE m_mechanic (
    m_id         NUMBER(5) NOT NULL,
    m_name       VARCHAR2(50 CHAR) NOT NULL,
    address      VARCHAR2(100 CHAR) NOT NULL,
    phone        VARCHAR2(15 CHAR),
    birth_date   DATE,
    tax_number   CHAR(10 CHAR) NOT NULL
);

ALTER TABLE m_mechanic
    ADD CONSTRAINT m_m_pk PRIMARY KEY ( m_id );

ALTER TABLE m_mechanic
    ADD CONSTRAINT m_m_un UNIQUE ( tax_number );

CREATE TABLE m_owner (
    o_id      NUMBER(5) NOT NULL,
    o_name    VARCHAR2(50 CHAR) NOT NULL,
    address   VARCHAR2(100 CHAR)
);


ALTER TABLE m_owner
    ADD CONSTRAINT m_o_pk PRIMARY KEY ( o_id );

CREATE TABLE m_owns (
    car_id        NUMBER(5) NOT NULL,
    date_of_buy   DATE NOT NULL,
    owner_id      NUMBER(5) NOT NULL
);

ALTER TABLE m_owns
    ADD CONSTRAINT m_os_pk PRIMARY KEY ( car_id,
                                         date_of_buy );

CREATE TABLE m_repair (
    car_id        NUMBER(5) NOT NULL,
    workshop_id   NUMBER(5) NOT NULL,
    start_date    DATE NOT NULL,
    end_date      DATE,
    repair_cost   NUMBER(10)
);


ALTER TABLE m_repair
    ADD CONSTRAINT m_r_pk PRIMARY KEY ( car_id,
                                        workshop_id,
                                        start_date );

CREATE TABLE m_works_for (
    mechanic_id           NUMBER(5) NOT NULL,
    workshop_id           NUMBER(5) NOT NULL,
    start_of_employment   DATE NOT NULL,
    end_of_employment     DATE,
    salary                NUMBER(10)
);


ALTER TABLE m_works_for
    ADD CONSTRAINT m_wf_pk PRIMARY KEY ( mechanic_id,
                                         workshop_id,
                                         start_of_employment );

CREATE TABLE m_workshop (
    w_id         NUMBER(5) NOT NULL,
    w_name       VARCHAR2(50 CHAR),
    address      VARCHAR2(100 CHAR) NOT NULL,
    manager_id   NUMBER(5)
);


ALTER TABLE m_workshop
    ADD CONSTRAINT m_w_pk PRIMARY KEY ( w_id );

ALTER TABLE m_car
    ADD CONSTRAINT m_c_cmo_fk FOREIGN KEY ( model_id )
        REFERENCES m_car_model ( cm_id )
    NOT DEFERRABLE;

ALTER TABLE m_car_evaluation
    ADD CONSTRAINT m_ce_c_fk FOREIGN KEY ( car_id )
        REFERENCES m_car ( c_id )
    NOT DEFERRABLE;

ALTER TABLE m_car_model
    ADD CONSTRAINT m_cmo_cma_fk FOREIGN KEY ( make )
        REFERENCES m_car_make ( brand )
    NOT DEFERRABLE;

ALTER TABLE m_owns
    ADD CONSTRAINT m_os_c_fk FOREIGN KEY ( car_id )
        REFERENCES m_car ( c_id )
    NOT DEFERRABLE;

ALTER TABLE m_owns
    ADD CONSTRAINT m_os_o_fk FOREIGN KEY ( owner_id )
        REFERENCES m_owner ( o_id )
    NOT DEFERRABLE;

ALTER TABLE m_repair
    ADD CONSTRAINT m_r_c_fk FOREIGN KEY ( car_id )
        REFERENCES m_car ( c_id )
    NOT DEFERRABLE;

ALTER TABLE m_repair
    ADD CONSTRAINT m_r_w_fk FOREIGN KEY ( workshop_id )
        REFERENCES m_workshop ( w_id )
    NOT DEFERRABLE;

ALTER TABLE m_workshop
    ADD CONSTRAINT m_w_m_fk FOREIGN KEY ( manager_id )
        REFERENCES m_mechanic ( m_id )
    NOT DEFERRABLE;

ALTER TABLE m_works_for
    ADD CONSTRAINT m_wf_m_fk FOREIGN KEY ( mechanic_id )
        REFERENCES m_mechanic ( m_id )
    NOT DEFERRABLE;

ALTER TABLE m_works_for
    ADD CONSTRAINT m_wf_w_fk FOREIGN KEY ( workshop_id )
        REFERENCES m_workshop ( w_id )
    NOT DEFERRABLE;



