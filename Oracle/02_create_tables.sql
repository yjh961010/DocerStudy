-- 회원 테이블 생성
ALTER SESSION SET CURRENT_SCHEMA = yjh;

CREATE TABLE nemember (
    grade             VARCHAR2(20),               
    memberID         VARCHAR2(20) PRIMARY KEY,   
    password         VARCHAR2(255),               
    name             VARCHAR2(100) NOT NULL,     
    profile          VARCHAR2(255),               
    nickname         VARCHAR2(100),               
    email            VARCHAR2(100),               
    phone            VARCHAR2(20),                
    signup_date      DATE DEFAULT SYSDATE         
);

CREATE TABLE nepreSavProd (
    subscription_id         VARCHAR2(20) PRIMARY KEY,        
    member_id               VARCHAR2(20) NOT NULL,           
    product_code            VARCHAR2(20) NOT NULL,           
    subscription_date       DATE DEFAULT SYSDATE,            
    subscription_amount     NUMBER(15, 2) NOT NULL,          
    subscription_select     VARCHAR2(20),                     
    termination_date        DATE,                              
    status                  VARCHAR2(20) DEFAULT '활성',     
    early_refund           NUMBER(15, 2),                     
    total_payment          NUMBER(15, 2),                     
    auto_enabled           CHAR(1) DEFAULT 'N',              
    auto_amount            NUMBER(15, 2),                     
    auto_cycle             VARCHAR2(20),                       
    auto_account           VARCHAR2(50),                       
    auto_date              VARCHAR2(10)                        
);

-- 시퀀스 생성(상품 코드)
CREATE SEQUENCE subscription_id_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE neSavProd (
    product_code          VARCHAR2(20) PRIMARY KEY,          
    product_name          VARCHAR2(100) NOT NULL,            
    product_image         VARCHAR2(50),                       
    base_rate             NUMBER(5, 2),                       
    goldenball_rate       NUMBER(5, 2),                       
    subscription_method    VARCHAR2(20),                       
    subscription_period    VARCHAR2(20),                       
    accumulated_amount     NUMBER(15, 2),                     
    termination_conditions VARCHAR2(2500),                    
    early_fee             NUMBER(5, 2),                       
    product_status        VARCHAR2(20) DEFAULT '활성',        
    minimum_deposit       NUMBER(15, 2),                      
    maximum_deposit       NUMBER(15, 2),                      
    start_date            DATE NOT NULL,                      
    end_date              DATE NOT NULL                       
);

-- 시퀀스 생성(상품 코드)
CREATE SEQUENCE product_code_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE nenotice (
    id          NUMBER PRIMARY KEY,          
    author       VARCHAR2(100),               
    subject      VARCHAR2(100),                
    content      VARCHAR2(2500),               
    createtime   DATE NOT NULL,                
    views       NUMBER DEFAULT 0,             
    re_step     NUMBER DEFAULT 0,              
    re_level    NUMBER DEFAULT 0                
);

-- 시퀀스 생성(공지)
CREATE SEQUENCE nenotice_seq;

CREATE TABLE necommunity (
    id          NUMBER PRIMARY KEY,          
    author       VARCHAR2(100),               
    subject      VARCHAR2(100),                
    content      VARCHAR2(2500),               
    createtime   DATE NOT NULL,                
    views       NUMBER DEFAULT 0,             
    re_step     NUMBER DEFAULT 0,              
    re_level    NUMBER DEFAULT 0                
);

-- 시퀀스 생성(커뮤니티)
CREATE SEQUENCE necommunity_seq;

CREATE TABLE neq_a (
    id          NUMBER PRIMARY KEY,          
    author       VARCHAR2(100),               
    subject      VARCHAR2(100),                
    content      VARCHAR2(2500),               
    createtime   DATE NOT NULL,                
    views       NUMBER DEFAULT 0,             
    re_step     NUMBER DEFAULT 0,              
    re_level    NUMBER DEFAULT 0                
);

-- 시퀀스 생성(Q&A)
CREATE SEQUENCE neq_a_seq;

CREATE TABLE neacount (
    acount_id       VARCHAR2(20) PRIMARY KEY,    
    acount_number   VARCHAR2(20) NOT NULL,       
    member_id       VARCHAR2(20) NOT NULL,       
    money           NUMBER(15),                   
    acount_status   CHAR(1) DEFAULT 'N'          
);

CREATE SEQUENCE neacount_seq
START WITH 1
INCREMENT BY 1;
