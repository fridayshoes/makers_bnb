CREATE TABLE accounts_table(account_id SERIAL PRIMARY KEY, first_name VARCHAR(50) NOT NULL, last_name VARCHAR (50) NOT NULL, email VARCHAR(100) UNIQUE NOT NULL , username VARCHAR(50) UNIQUE NOT NULL, password VARCHAR(20) NOT NULL);