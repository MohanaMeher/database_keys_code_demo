# DATABASE KEYS CODE DEMO


The sql file has code that can be used to demonstrate a way to apply each of the primary, unique and foreign key constraints to a given table  and the issues one can encounter if the data added to the table violates these constraints.
The code has embedded insertion queries for some sample data for anyone to be able to execute the SQL on their local.

The example considered to demonstrate this topic is of an owners and pets table .
The owners table  stores a list of owners of pets that have attributes such as owner id, name, city , email id and mobile number.
The pets table stores a list of pets that the owners have with attributes such as pet id , name , type , owner id .

Below are the columns in both the tables that have constraints defined.

**Owners table:**

owner id - Primar key
email id - unique key
mobile number- unique key

**Pets table:**

petid - Primary key
owner id - foreign keey


==========================================================================================================

**Keys**:

**Primary Key**

1. A column/Attribute that can uniquely identify each row. 
2. The value in this column has to _unique_ for each row and _non null_.
3. A table is allowed to have _only one_ primary key.
4. Primary key is declared by applying the '_Primary Key_' constraint in the table structure.

**Unique Key**

1. The value in this column has to be unique for each row.
2. But it differs from Primary key that values _can be null_ in this column.
3. A table can have _more than one_ unique keys (more than one columns can have the unique key constraint).
4. Unique key is declared by applying the '_unique_' constraint in the table structure.

**Foreign Key**

1. Foreign Key is used to link 2 tables - It is a field in the table that is Primary key in another table.
2. The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
3. The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.
4. It is declared by using the '_foreign key references_' in the table structure of the child tables
