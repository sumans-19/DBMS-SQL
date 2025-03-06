CREATE TABLE SALESMAN(SALESMAN_ID INTEGER PRIMARY KEY,NAME VARCHAR(20) , CITY VARCHAR(20) , COMMISSION VARCHAR(20) );
DESC SALESMAN;
INSERT INTO SALESMAN VALUES(&SALESMAN_ID , '&NAME' , '&CITY' , '&COMMISSION');
SELECT * FROM SALESMAN;S
CREATE TABLE CUSTOMER(CUSTOMER_ID INTEGER PRIMARY KEY , CUST_NAME VARCHAR(20) ,CITY VARCHAR(20) , GRADE INTEGER , SALESMAN_ID REFERENCES SALESMAN(SALESMAN_ID) ON DELETE SET NULL );
INSERT INTO CUSTOMER VALUES(&CUSTOMER_ID , '&CUST_NAME' , '&CITY' , &GRADE , &SALESMAN_ID);
CREATE TABLE ORDERS (ORD_NO INTEGER PRIMARY KEY , PURCHASE_AMT NUMBER , ORD_DATE DATE,CUSTOMER_ID REFERENCES CUSTOMER(CUSTOMER_ID) ON DELETE SET NULL , SALESMAN_ID REFERENCES SALESMAN(SALESMAN_ID) ON DELETE SET NULL);
INSERT INTO ORDERS VALUES (&ORD_NO , &PURCHASE_AMT,'&ORD_DATE' , &CUSTOMER_ID , &SALESMAN_ID );


QUERIES:
1} SELECT GRADE , COUNT(CUSTOMER_ID) FROM CUSTOMER GROUP BY GRADE HAVING GRADE> (SELECT AVG(GRADE) FROM CUSTOMER WHERE CITY = 'BANGLORE');
2} SELECT SALESMAN_ID , NAME FROM SALESMAN A , WHERE 1<(SELECT COUNT(*) FROM CUSTOMER C WHERE C.SALESMAN_ID  = A.SALESMAN_ID );
3} SELECT S.SALESMAN_ID , NAME , CUST_NAME , COMMISSION FROM SALESMAN S,CUSTOMER C WHERE S.CITY = C.CITY UNION SELECT S.SALESMAN_ID ,S.NAME ,  NO_MATCH ,COMMISSION FROM SALESMAN S , CUSTOMER C WHERE NOT CITY = ANY(SELECT CITY FROM  CUSTOMER);
