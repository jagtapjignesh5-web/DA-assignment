use new_schema ;
create table company (
    companyid int primary key auto_increment,
    companyname varchar(100)
);


----- Q.1   1) Statement to create the Contact table -----
create table contact (
    contactid int primary key auto_increment,
    companyid int,
    firstname varchar(50),
    lastname varchar(50),
    phone varchar(20),
    email varchar(100),
    foreign key (companyid) references company(companyid)
);


----- 2) Statement to create the Employee table -----
create table employee (
    employeeid int primary key auto_increment,
    firstname varchar(50),
    lastname varchar(50),
    phone varchar(20),
    title varchar(50)
);


----- 3) Statement to create the ContactEmployee table -----
create table contactemployee (
    contactemployeeid int primary key auto_increment,
    contactid int,
    employeeid int,
    contactdate date,
    description varchar(255),
    foreign key (contactid) references contact(contactid),
    foreign key (employeeid) references employee(employeeid)
);


----- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 -----
UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';


----- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” . ------
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';


----- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement). -----
DELETE FROM ContactEmployee
WHERE EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Dianne' AND LastName = 'Connor')
  AND ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Jack' AND LastName = 'Lee');
 
 
----- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in MySQL Workbench. Copy the results below as well. -----
SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';


----- 8) What is the significance of “%” and “_” operators in the LIKE statement? ----
----- answer
----- % :- (Percent Sign): Represents zero, one, or multiple characters.
----- _ :- (Underscore): Represents a single, specific character.


----- 9) Explain normalization in the context of databases. -----
----- answer
----- Normalization is the process of organizing data in a database to reduce data redundancy (duplicate data) and improve data integrity.


----- 10) What does a join in MySQL mean?
----- answer
----- A JOIN is a standard SQL operation used to combine rows from two or more tables based on a related column 
----- (usually primary and foreign keys) that exists between them.


----- 11) 19.What do you understand about DDL, DCL, and DML in MySQL? ------
----- answer
----- DDL (Data Definition Language): Used to define or alter the database structure/schema. :- CREATE, ALTER, DROP, TRUNCATE.
----- DML (Data Manipulation Language): Used to manage, retrieve, and modify the actual data inside the tables. :-SELECT, INSERT, UPDATE, DELETE.
----- DCL (Data Control Language): Used to control access, permissions, and security for the database. :- GRANT, REVOKE.


----- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins?

----- INNER JOIN: Returns only the records that have matching values in both tables.

----- LEFT JOIN: Returns all records from the left table, and the matched records from the right table.
----- If there is no match, the result is NULL from the right side.

----- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table.

----- FULL OUTER JOIN: Returns all records when there is a match in either the left or right table 
----- (Note: MySQL achieves this by combining a LEFT JOIN and a RIGHT JOIN using UNION).


-----     use below data -----
insert into company (companyname) values 
('Urban Outfitters, Inc.'), ('Toll Brothers'), ('Tech Data'), ('Comcast'), ('Aramark'), 
('Crown Holdings'), ('Lincoln National'), ('Universal Health Services'), ('AmerisourceBergen'), ('Campbell Soup Co.'),
('Apple'), ('Google'), ('Microsoft'), ('Amazon'), ('Meta'), 
('Tesla'), ('Netflix'), ('Spotify'), ('Salesforce'), ('Adobe'),
('Oracle'), ('IBM'), ('Intel'), ('Cisco'), ('HP'), 
('Dell'), ('Lenovo'), ('Sony'), ('Samsung'), ('LG'),
('Nike'), ('Adidas'), ('Puma'), ('Under Armour'), ('Reebok'),
('Coca-Cola'), ('PepsiCo'), ('Nestle'), ('Kraft Heinz'), ('General Mills'),
('Ford'), ('General Motors'), ('Toyota'), ('Honda'), ('Volkswagen'),
('JPMorgan Chase'), ('Bank of America'), ('Wells Fargo'), ('Citigroup'), ('Goldman Sachs');
insert into employee (firstname, lastname, phone, title) values 
('Lesley', 'Bland', '215-555-0000', 'Recruiter'),
('Dianne', 'Connor', '215-555-1111', 'Sales Manager'),
('Michael', 'Scott', '215-555-2222', 'Regional Manager'),
('Jim', 'Halpert', '215-555-3333', 'Sales Representative'),
('Pam', 'Beesly', '215-555-4444', 'Administrator'),
('Dwight', 'Schrute', '215-555-5555', 'Assistant Regional Manager'),
('Angela', 'Martin', '215-555-6666', 'Accountant'),
('Kevin', 'Malone', '215-555-7777', 'Accountant'),
('Stanley', 'Hudson', '215-555-8888', 'Sales Representative'),
('Phyllis', 'Vance', '215-555-9999', 'Sales Representative'),
('Kelly', 'Kapoor', '215-555-0101', 'Customer Service'),
('Toby', 'Flenderson', '215-555-0202', 'HR Representative'),
('Creed', 'Bratton', '215-555-0303', 'Quality Assurance'),
('Meredith', 'Palmer', '215-555-0404', 'Supplier Relations'),
('Ryan', 'Howard', '215-555-0505', 'Temp'),
('Andy', 'Bernard', '215-555-0606', 'Sales Representative'),
('Erin', 'Hannon', '215-555-0707', 'Receptionist'),
('Gabe', 'Lewis', '215-555-0808', 'Management Consultant'),
('Darryl', 'Philbin', '215-555-0909', 'Warehouse Foreman'),
('Roy', 'Anderson', '215-555-1010', 'Warehouse Worker'),
('Jan', 'Levinson', '215-555-1212', 'VP of Sales'),
('David', 'Wallace', '215-555-1313', 'CFO'),
('Holly', 'Flax', '215-555-1414', 'HR Representative'),
('Charles', 'Miner', '215-555-1515', 'VP of Region'),
('Robert', 'California', '215-555-1616', 'CEO'),
('Jo', 'Bennett', '215-555-1717', 'CEO'),
('Nellie', 'Bertram', '215-555-1818', 'Special Projects'),
('Pete', 'Miller', '215-555-1919', 'Customer Service'),
('Clark', 'Green', '215-555-2020', 'Customer Service'),
('Todd', 'Packer', '215-555-2121', 'Traveling Salesman'),
('Leslie', 'Knope', '215-555-2323', 'Deputy Director'),
('Ron', 'Swanson', '215-555-2424', 'Director'),
('Tom', 'Haverford', '215-555-2525', 'Administrator'),
('April', 'Ludgate', '215-555-2626', 'Assistant'),
('Andy', 'Dwyer', '215-555-2727', 'Shoe Shiner'),
('Ann', 'Perkins', '215-555-2828', 'Nurse'),
('Ben', 'Wyatt', '215-555-2929', 'State Auditor'),
('Chris', 'Traeger', '215-555-3030', 'City Manager'),
('Donna', 'Meagle', '215-555-3131', 'Office Manager'),
('Jerry', 'Gergich', '215-555-3232', 'Office Worker'),
('Jean-Ralphio', 'Saperstein', '215-555-3434', 'Entrepreneur'),
('Mona-Lisa', 'Saperstein', '215-555-3535', 'Assistant'),
('Craig', 'Middlebrooks', '215-555-3636', 'Director'),
('Mark', 'Brendanawicz', '215-555-3737', 'City Planner'),
('Jake', 'Peralta', '215-555-3838', 'Detective'),
('Amy', 'Santiago', '215-555-3939', 'Sergeant'),
('Rosa', 'Diaz', '215-555-4040', 'Detective'),
('Terry', 'Jeffords', '215-555-4141', 'Lieutenant'),
('Raymond', 'Holt', '215-555-4242', 'Captain'),
('Charles', 'Boyle', '215-555-4343', 'Detective');
insert into contact (companyid, firstname, lastname, phone, email) values 
(1, 'Jack', 'Lee', '215-555-9000', 'jack.lee@urban.com'),
(2, 'Sarah', 'Conner', '215-555-9001', 'sarah.c@tollbrothers.com'),
(3, 'Bruce', 'Wayne', '215-555-9002', 'bruce@techdata.com'),
(4, 'Clark', 'Kent', '215-555-9003', 'clark@comcast.com'),
(5, 'Diana', 'Prince', '215-555-9004', 'diana@aramark.com'),
(6, 'Barry', 'Allen', '215-555-9005', 'barry@crown.com'),
(7, 'Hal', 'Jordan', '215-555-9006', 'hal@lincoln.com'),
(8, 'Arthur', 'Curry', '215-555-9007', 'arthur@uhs.com'),
(9, 'Oliver', 'Queen', '215-555-9008', 'oliver@amerisource.com'),
(10, 'Tony', 'Stark', '215-555-9009', 'tony@campbellsoup.com'),
(11, 'Steve', 'Rogers', '215-555-9010', 'steve@apple.com'),
(12, 'Natasha', 'Romanoff', '215-555-9011', 'natasha@google.com'),
(13, 'Clint', 'Barton', '215-555-9012', 'clint@microsoft.com'),
(14, 'Wanda', 'Maximoff', '215-555-9013', 'wanda@amazon.com'),
(15, 'Vision', 'Android', '215-555-9014', 'vision@meta.com'),
(16, 'Sam', 'Wilson', '215-555-9015', 'sam@tesla.com'),
(17, 'Bucky', 'Barnes', '215-555-9016', 'bucky@netflix.com'),
(18, 'Scott', 'Lang', '215-555-9017', 'scott@spotify.com'),
(19, 'Hope', 'Van Dyne', '215-555-9018', 'hope@salesforce.com'),
(20, 'Carol', 'Danvers', '215-555-9019', 'carol@adobe.com'),
(21, 'Peter', 'Parker', '215-555-9020', 'peter@oracle.com'),
(22, 'Stephen', 'Strange', '215-555-9021', 'stephen@ibm.com'),
(23, 'TChalla', 'King', '215-555-9022', 'tchalla@intel.com'),
(24, 'Nick', 'Fury', '215-555-9023', 'nick@cisco.com'),
(25, 'Maria', 'Hill', '215-555-9024', 'maria@hp.com'),
(26, 'Phil', 'Coulson', '215-555-9025', 'phil@dell.com'),
(27, 'Luke', 'Skywalker', '215-555-9026', 'luke@lenovo.com'),
(28, 'Leia', 'Organa', '215-555-9027', 'leia@sony.com'),
(29, 'Han', 'Solo', '215-555-9028', 'han@samsung.com'),
(30, 'Chewbacca', 'Wookiee', '215-555-9029', 'chewie@lg.com'),
(31, 'Lando', 'Calrissian', '215-555-9030', 'lando@nike.com'),
(32, 'Mace', 'Windu', '215-555-9031', 'mace@adidas.com'),
(33, 'Obi-Wan', 'Kenobi', '215-555-9032', 'obiwan@puma.com'),
(34, 'Anakin', 'Skywalker', '215-555-9033', 'anakin@underarmour.com'),
(35, 'Padme', 'Amidala', '215-555-9034', 'padme@reebok.com'),
(36, 'Qui-Gon', 'Jinn', '215-555-9035', 'quigon@cocacola.com'),
(37, 'Ahsoka', 'Tano', '215-555-9036', 'ahsoka@pepsico.com'),
(38, 'Boba', 'Fett', '215-555-9037', 'boba@nestle.com'),
(39, 'Din', 'Djarin', '215-555-9038', 'din@kraftheinz.com'),
(40, 'Grogu', 'Child', '215-555-9039', 'grogu@generalmills.com'),
(41, 'Frodo', 'Baggins', '215-555-9040', 'frodo@ford.com'),
(42, 'Samwise', 'Gamgee', '215-555-9041', 'samwise@gm.com'),
(43, 'Merry', 'Brandybuck', '215-555-9042', 'merry@toyota.com'),
(44, 'Pippin', 'Took', '215-555-9043', 'pippin@honda.com'),
(45, 'Aragorn', 'Elessar', '215-555-9044', 'aragorn@vw.com'),
(46, 'Legolas', 'Greenleaf', '215-555-9045', 'legolas@jpmorgan.com'),
(47, 'Gimli', 'Gloin', '215-555-9046', 'gimli@bofa.com'),
(48, 'Gandalf', 'Grey', '215-555-9047', 'gandalf@wellsfargo.com'),
(49, 'Boromir', 'Denethor', '215-555-9048', 'boromir@citi.com'),
(50, 'Elrond', 'Halfelven', '215-555-9049', 'elrond@goldmansachs.com');
insert into contactemployee (contactid, employeeid, contactdate, description) values 
(1, 2, '2014-03-12', 'Initial interview'),
(2, 3, '2014-03-14', 'Sales pitch'),
(3, 1, '2014-03-15', 'Follow up call'),
(4, 4, '2014-03-16', 'Contract negotiation'),
(5, 6, '2014-03-17', 'Site visit'),
(6, 4, '2014-03-18', 'Lunch meeting'),
(7, 5, '2014-03-19', 'Introductory email'),
(8, 2, '2014-03-20', 'Closing deal'),
(9, 3, '2014-03-21', 'Quarterly review'),
(10, 9, '2014-03-22', 'Client complaint resolution'),
(11, 10, '2014-03-23', 'Vendor onboarding'),
(12, 11, '2014-03-24', 'Support ticket resolution'),
(13, 12, '2014-03-25', 'Compliance audit'),
(14, 13, '2014-03-26', 'Quality check meeting'),
(15, 14, '2014-03-27', 'Supply chain review'),
(16, 15, '2014-03-28', 'Temporary staffing check'),
(17, 16, '2014-03-29', 'Product demo'),
(18, 17, '2014-03-30', 'Facility tour'),
(19, 18, '2014-04-01', 'Management consulting phase 1'),
(20, 19, '2014-04-02', 'Logistics planning'),
(21, 20, '2014-04-03', 'Inventory management'),
(22, 21, '2014-04-04', 'Executive summit'),
(23, 22, '2014-04-05', 'Financial forecasting'),
(24, 23, '2014-04-06', 'HR benefits negotiation'),
(25, 24, '2014-04-07', 'Regional strategy meeting'),
(26, 25, '2014-04-08', 'Board of directors intro'),
(27, 26, '2014-04-09', 'Merger discussion'),
(28, 27, '2014-04-10', 'Special project kickoff'),
(29, 28, '2014-04-11', 'Customer feedback session'),
(30, 29, '2014-04-12', 'Service level agreement review'),
(31, 30, '2014-04-13', 'Field sales visit'),
(32, 31, '2014-04-14', 'Government liaison meeting'),
(33, 32, '2014-04-15', 'Permit approval'),
(34, 33, '2014-04-16', 'Event planning'),
(35, 34, '2014-04-17', 'Scheduling conflict resolution'),
(36, 35, '2014-04-18', 'Maintenance request'),
(37, 36, '2014-04-19', 'Healthcare package review'),
(38, 37, '2014-04-20', 'Tax audit preparation'),
(39, 38, '2014-04-21', 'Public relations alignment'),
(40, 39, '2014-04-22', 'Real estate acquisition'),
(41, 40, '2014-04-23', 'Document filing'),
(42, 41, '2014-04-24', 'Startup funding pitch'),
(43, 42, '2014-04-25', 'Investor relations'),
(44, 43, '2014-04-26', 'Marketing campaign review'),
(45, 44, '2014-04-27', 'Zoning law consultation'),
(46, 45, '2014-04-28', 'Security assessment'),
(47, 46, '2014-04-29', 'Training seminar'),
(48, 47, '2014-04-30', 'Risk management review'),
(49, 48, '2014-05-01', 'Tactical planning'),
(50, 49, '2014-05-02', 'Annual performance review');







