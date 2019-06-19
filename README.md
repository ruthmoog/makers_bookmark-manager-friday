As a person,
So that I can see bookmarks I have logged,
I’d like to see a list of bookmarks on my screen

Noun      Verb
Person    See*
Bookmark*    
List*    
Screen    

Bookmark <— See —> List

Four steps to creating a database using PSQL (download Postgresql)

1.Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

## Database for Testing
1. connect to psql using the command line command `psql`.
0. create a database for testing using `CREATE DATABASE bookmark_manager_test;`.
0. connect to the database with `\c bookmark_manager_test` and create a table in the test database `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));`.
0. 

