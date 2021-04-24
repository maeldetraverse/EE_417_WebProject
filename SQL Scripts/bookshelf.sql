CREATE TABLE testdb.bookshelf_user (

id INT NOT NULL AUTO_INCREMENT,
username VARCHAR(45) NOT NULL,
password VARCHAR(45) NOT NULL,
first_name VARCHAR(45),
last_name VARCHAR(45),
email VARCHAR(45) NOT NULL,
address VARCHAR(100),
zipcode VARCHAR(45),
roles VARCHAR(255),

PRIMARY KEY (id),

UNIQUE (id),
UNIQUE (username),
UNIQUE (email)
);

CREATE TABLE testdb.bookshelf_book (

id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255) NULL,
author VARCHAR(255) NULL,
description VARCHAR(255) NULL,
category VARCHAR(255) NULL,
publisher VARCHAR(255) NULL,
rating DECIMAL(2,1) NULL,
price DECIMAL(9,2) NULL,
thumbnail_url VARCHAR(255) NULL,
stock INT NULL,

PRIMARY KEY (id),

UNIQUE (id)
);

CREATE TABLE testdb.bookshelf_order (

id INT NOT NULL AUTO_INCREMENT,
user_id INT NOT NULL,
t_stamp DATETIME NOT NULL,
amount DECIMAL(6,2) NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (user_id) REFERENCES testdb.bookshelf_user(id),

UNIQUE (id)
);

CREATE TABLE testdb.bookshelf_order_line (

id INT NOT NULL AUTO_INCREMENT,
order_id INT NOT NULL,
order_line_number INT NOT NULL,
book_id INT NOT NULL,
quantity INT NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (order_id) REFERENCES testdb.bookshelf_order(id),
FOREIGN KEY (book_id) REFERENCES testdb.bookshelf_book(id),

UNIQUE (id)
);

INSERT INTO testdb.bookshelf_user
(id,username,password,first_name,last_name,email,address,zipcode,roles)
VALUES
(1,'jamesc10','password','James','Conlon','james@mail.com','Dublin','DRB4G32','engineer'),
(2,'keatonc16','pass1','Michael','Keaton','mkeaton@gmail.com','Hollywood','BAT3249',''),
(3,'tjones','mypass','Tom','Jones','tom@tomjones.com','Wales','302AM12','engineer'),
(4,'markymark','password1','Mark','Wahlberg','mark@wahlberg.com','Bawston','H56GD49','supervisor'),
(5,'marymac','abcdefg','Mary','McAleese','mary@gov.ie','Belfast','901QBR6','admin,supervisor');

INSERT INTO testdb.bookshelf_book
(id,title,author,description,category,publisher,rating,price,thumbnail_url,stock)
VALUES
(1,'The Hunger Games','Suzanne Collins','','childrens','',4.3,31.60,'https://images.gr-assets.com/books/1447303603m/2767052.jpg',272),
(2,'Harry Potter and the Sorcerer\'s Stone','J.K. Rowling','','childrens','',4.4,8.57,'https://images.gr-assets.com/books/1474154022m/3.jpg',491),
(3,'Twilight','Stephenie Meyer','','childrens','',3.6,29.11,'https://images.gr-assets.com/books/1361039443m/41865.jpg',226),
(4,'To Kill a Mockingbird','Harper Lee','','classics','',4.3,11.46,'https://images.gr-assets.com/books/1361975680m/2657.jpg',487),
(5,'The Great Gatsby','F. Scott Fitzgerald','','classics','',3.9,36.11,'https://images.gr-assets.com/books/1490528560m/4671.jpg',1356),
(6,'The Fault in Our Stars','John Green','','novel','',4.3,25.69,'https://images.gr-assets.com/books/1360206420m/11870085.jpg',226),
(7,'The Hobbit','J.R.R. Tolkien','','classics','',4.3,10.92,'https://images.gr-assets.com/books/1372847500m/5907.jpg',969),
(8,'The Catcher in the Rye','J.D. Salinger','','classics','',3.8,6.20,'https://images.gr-assets.com/books/1398034300m/5107.jpg',360),
(9,'Angels & Demons ','Dan Brown','','novel','',3.9,11.83,'https://images.gr-assets.com/books/1303390735m/960.jpg',311),
(10,'Pride and Prejudice','Jane Austen','','classics','',4.2,25.44,'https://images.gr-assets.com/books/1320399351m/1885.jpg',3455),
(11,'The Kite Runner','Khaled Hosseini','','novel','',4.3,27.57,'https://images.gr-assets.com/books/1484565687m/77203.jpg',283),
(12,'Divergent','Veronica Roth','','childrens','',4.2,40.96,'https://images.gr-assets.com/books/1328559506m/13335037.jpg',210),
(13,'1984','George Orwell','','classics','',4.1,32.69,'https://images.gr-assets.com/books/1348990566m/5470.jpg',995),
(14,'Animal Farm','George Orwell','','classics','',3.9,27.50,'https://images.gr-assets.com/books/1424037542m/7613.jpg',896),
(15,'The Diary of a Young Girl','Anne Frank','','classics','',4.1,15.40,'https://images.gr-assets.com/books/1358276407m/48855.jpg',710),
(16,'The Girl with the Dragon Tattoo','Stieg Larsson','','novel','',4.1,10.77,'https://images.gr-assets.com/books/1327868566m/2429135.jpg',274),
(17,'Catching Fire','Suzanne Collins','','childrens','',4.3,12.48,'https://images.gr-assets.com/books/1358273780m/6148028.jpg',201),
(18,'Harry Potter and the Prisoner of Azkaban','J.K. Rowling','','childrens','',4.5,23.99,'https://images.gr-assets.com/books/1499277281m/5.jpg',376),
(19,'The Fellowship of the Ring','J.R.R. Tolkien','','classics','',4.3,6.87,'https://images.gr-assets.com/books/1298411339m/34.jpg',566),
(20,'Mockingjay','Suzanne Collins','','childrens','',4.0,15.25,'https://images.gr-assets.com/books/1358275419m/7260188.jpg',239),
(21,'Harry Potter and the Order of the Phoenix','J.K. Rowling','','childrens','',4.5,31.94,'https://images.gr-assets.com/books/1387141547m/2.jpg',307),
(22,'The Lovely Bones','Alice Sebold','','novel','',3.8,38.99,'https://images.gr-assets.com/books/1457810586m/12232938.jpg',183),
(23,'Harry Potter and the Chamber of Secrets','J.K. Rowling','','childrens','',4.4,8.82,'https://images.gr-assets.com/books/1474169725m/15881.jpg',398),
(24,'Harry Potter and the Goblet of Fire','J.K. Rowling','','childrens','',4.5,35.18,'https://images.gr-assets.com/books/1361482611m/6.jpg',332),
(25,'Harry Potter and the Deathly Hallows','J.K. Rowling','','childrens','',4.6,25.70,'https://images.gr-assets.com/books/1474171184m/136251.jpg',263),
(26,'The Da Vinci Code','Dan Brown','','novel','',3.8,17.27,'https://images.gr-assets.com/books/1303252999m/968.jpg',350),
(27,'Harry Potter and the Half-Blood Prince','J.K. Rowling','','childrens','',4.5,21.31,'https://images.gr-assets.com/books/1361039191m/1.jpg',275),
(28,'Lord of the Flies','William Golding','','classics','',3.6,18.08,'https://images.gr-assets.com/books/1327869409m/7624.jpg',458),
(29,'Romeo and Juliet','William Shakespeare','','classics','',3.7,26.56,'https://images.gr-assets.com/books/1327872146m/18135.jpg',1937),
(30,'Gone Girl','Gillian Flynn','','novel','',4.0,9.77,'https://images.gr-assets.com/books/1339602131m/8442457.jpg',196),
(31,'The Help','Kathryn Stockett','','novel','',4.5,11.65,'https://images.gr-assets.com/books/1346100365m/4667024.jpg',183),
(32,'Of Mice and Men','John Steinbeck','','classics','',3.8,22.83,'https://images.gr-assets.com/books/1437235233m/890.jpg',373),
(33,'Memoirs of a Geisha','Arthur Golden','','novel','',4.1,7.31,'https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png',220),
(34,'Fifty Shades of Grey','E.L. James','','novel','',3.7,33.96,'https://images.gr-assets.com/books/1385207843m/10818853.jpg',169),
(35,'The Alchemist','Paulo Coelho','','classics','',3.8,24.88,'https://images.gr-assets.com/books/1483412266m/865.jpg',458),
(36,'The Giver','Lois Lowry','','classics','',4.1,27.71,'https://images.gr-assets.com/books/1342493368m/3636.jpg',192),
(37,'The Lion, the Witch, and the Wardrobe','C.S. Lewis','','childrens','',4.2,29.75,'https://images.gr-assets.com/books/1353029077m/100915.jpg',474),
(38,'The Time Traveler\'s Wife','Audrey Niffenegger','','novel','',4.0,38.19,'https://images.gr-assets.com/books/1437728815m/14050.jpg',167),
(39,'A Game of Thrones','George R.R. Martin','','novel','',4.5,16.16,'https://images.gr-assets.com/books/1436732693m/13496.jpg',101),
(40,'Eat, Pray, Love','Elizabeth Gilbert','','novel','',3.5,25.95,'https://images.gr-assets.com/books/1503066414m/19501.jpg',185),
(41,'The Lightning Thief','Rick Riordan','','childrens','',4.2,34.48,'https://images.gr-assets.com/books/1400602609m/28187.jpg',159),
(42,'Little Women','Louisa May Alcott','','classics','',4.0,23.46,'https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png',1707),
(43,'Jane Eyre','Charlotte Bronte','','classics','',4.1,30.31,'https://images.gr-assets.com/books/1327867269m/10210.jpg',2568),
(44,'The Notebook','Nicholas Sparks','','novel','',4.1,27.73,'https://images.gr-assets.com/books/1385738917m/15931.jpg',190),
(45,'Life of Pi','Yann Martel','','novel','',3.9,32.15,'https://images.gr-assets.com/books/1320562005m/4214.jpg',264),
(46,'Water for Elephants','Sara Gruen','','novel','',4.1,14.93,'https://images.gr-assets.com/books/1494428973m/43641.jpg',128),
(47,'The Book Thief','Markus Zusak','','novel','',4.4,6.50,'https://images.gr-assets.com/books/1390053681m/19063.jpg',251),
(48,'Fahrenheit 451','Ray Bradbury','','novel','',4.0,29.38,'https://images.gr-assets.com/books/1351643740m/4381.jpg',507),
(49,'New Moon','Stephenie Meyer','','childrens','',3.5,24.23,'https://images.gr-assets.com/books/1361039440m/49041.jpg',194),
(50,'Where the Sidewalk Ends','Shel Silverstein','','classics','',4.3,7.36,'https://images.gr-assets.com/books/1168052448m/30119.jpg',45),
(51,'City of Bones','Cassandra Clare','','childrens','',4.1,10.31,'https://images.gr-assets.com/books/1432730315m/256683.jpg',178),
(52,'Eclipse','Stephenie Meyer','','childrens','',3.7,6.32,'https://images.gr-assets.com/books/1361038355m/428263.jpg',185),
(53,'Eragon','Christopher Paolini','','childrens','',3.9,5.52,'https://images.gr-assets.com/books/1366212852m/113436.jpg',217),
(54,'The Hitchhiker\'s Guide to the Galaxy','Douglas Adams','','classics','',4.2,34.61,'https://images.gr-assets.com/books/1327656754m/11.jpg',257),
(55,'Brave New World','Aldous Huxley','','classics','',4.0,26.11,'https://images.gr-assets.com/books/1487389574m/5129.jpg',515),
(56,'Breaking Dawn','Stephenie Meyer','','childrens','',3.7,33.70,'https://images.gr-assets.com/books/1361039438m/1162543.jpg',183),
(57,'The Secret Life of Bees','Sue Monk Kidd','','novel','',4.0,37.30,'https://images.gr-assets.com/books/1473454532m/37435.jpg',125),
(58,'The Adventures of Huckleberry Finn','Mark Twain','','classics','',3.8,23.32,'https://images.gr-assets.com/books/1405973850m/2956.jpg',2277),
(59,'Charlotte\'s Web','E.B. White','','childrens','',4.2,16.30,'https://images.gr-assets.com/books/1439632243m/24178.jpg',180),
(60,'The Curious Incident of the Dog in the Night-Time','Mark Haddon','','novel','',3.9,11.59,'https://images.gr-assets.com/books/1479863624m/1618.jpg',183),
(61,'The Girl on the Train','Paula Hawkins','','novel','',3.9,25.22,'https://images.gr-assets.com/books/1490903702m/22557272.jpg',14),
(62,'The Golden Compass','Philip Pullman','','childrens','',3.9,27.32,'https://images.gr-assets.com/books/1451271747m/119322.jpg',287),
(63,'Wuthering Heights','Emily Bronte','','classics','',3.8,20.94,'https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png',2498),
(64,'My Sister\'s Keeper','Jodi Picoult','','novel','',4.1,32.55,'https://images.gr-assets.com/books/1369504683m/10917.jpg',125),
(65,'Slaughterhouse-Five','Kurt Vonnegut Jr.','','classics','',4.1,26.72,'https://images.gr-assets.com/books/1440319389m/4981.jpg',241),
(66,'Gone with the Wind','Margaret Mitchell','','classics','',4.3,34.18,'https://images.gr-assets.com/books/1328025229m/18405.jpg',409),
(67,'A Thousand Splendid Suns','Khaled Hosseini','','novel','',4.3,39.21,'https://images.gr-assets.com/books/1345958969m/128029.jpg',197),
(68,'The Perks of Being a Wallflower','Stephen Chbosky','','novel','',4.2,14.44,'https://images.gr-assets.com/books/1167352178m/22628.jpg',128),
(69,'Insurgent','Veronica Roth','','childrens','',4.1,9.25,'https://images.gr-assets.com/books/1325667729m/11735983.jpg',164),
(70,'Ender\'s Game','Orson Scott Card','','childrens','',4.3,39.64,'https://images.gr-assets.com/books/1408303130m/375802.jpg',224),
(71,'Frankenstein','Mary Wollstonecraft Shelley','','classics','',3.8,34.90,'https://images.gr-assets.com/books/1381512375m/18490.jpg',2618),
(72,'The Shining','Stephen King','','classics','',4.2,28.31,'https://images.gr-assets.com/books/1353277730m/11588.jpg',289),
(73,'The Host','Stephenie Meyer','','childrens','',3.8,9.98,'https://images.gr-assets.com/books/1318009171m/1656001.jpg',161),
(74,'Looking for Alaska','John Green','','novel','',4.1,37.47,'https://images.gr-assets.com/books/1394798630m/99561.jpg',187),
(75,'Bridget Jones\'s Diary','Helen Fielding','','novel','',3.8,21.15,'https://images.gr-assets.com/books/1292060045m/227443.jpg',193),
(76,'Sense and Sensibility','Jane Austen','','classics','',4.1,40.52,'https://images.gr-assets.com/books/1397245675m/14935.jpg',1969),
(77,'Holes','Louis Sachar','','childrens','',3.9,19.63,'https://images.gr-assets.com/books/1327781893m/38709.jpg',138),
(78,'The Devil Wears Prada','Lauren Weisberger','','novel','',3.7,39.79,'https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png',129),
(79,'The Odyssey','Homer','','classics','',3.7,31.81,'https://images.gr-assets.com/books/1390173285m/1381.jpg',1703),
(80,'The Little Prince','Antoine de Saint-Exupéry','','classics','',4.3,19.96,'https://images.gr-assets.com/books/1367545443m/157993.jpg',1708),
(81,'The Glass Castle','Jeannette Walls','','novel','',4.2,23.53,'https://images.gr-assets.com/books/1400930557m/7445.jpg',92),
(82,'Into the Wild','Jon Krakauer','','novel','',3.9,30.18,'https://images.gr-assets.com/books/1403173986m/1845.jpg',108),
(83,'A Tale of Two Cities','Charles Dickens','','classics','',3.8,8.83,'https://images.gr-assets.com/books/1344922523m/1953.jpg',525),
(84,'Jurassic Park','Michael Crichton','','novel','',4.0,19.67,'https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png',176),
(85,'The Giving Tree','Shel Silverstein','','childrens','',4.4,17.39,'https://images.gr-assets.com/books/1174210942m/370493.jpg',81),
(86,'A Time to Kill','John Grisham','','novel','',4.0,22.84,'https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png',158),
(87,'Night','Elie Wiesel, Marion Wiesel','','classics','',4.3,21.73,'https://images.gr-assets.com/books/1473495285m/1617.jpg',109),
(88,'Paper Towns','John Green','','childrens','',3.9,27.22,'https://images.gr-assets.com/books/1349013610m/6442769.jpg',178),
(89,'The Princess Bride ','William Goldman','','childrens','',4.3,32.42,'https://images.gr-assets.com/books/1327903636m/21787.jpg',129),
(90,'The Outsiders','S.E. Hinton','','classics','',4.1,30.34,'https://images.gr-assets.com/books/1442129426m/231804.jpg',156),
(91,'The Maze Runner','James Dashner','','childrens','',4.0,7.15,'https://images.gr-assets.com/books/1375596592m/6186357.jpg',147),
(92,'Freakonomics: A Rogue Economist Explores the Hidden Side of Everything','Steven D. Levitt','','nonfiction','',3.9,5.48,'https://images.gr-assets.com/books/1327909092m/1202.jpg',124),
(93,'The Secret Garden','Frances Hodgson Burnett','','classics','',4.1,13.21,'https://images.gr-assets.com/books/1327873635m/2998.jpg',1350),
(94,'One Hundred Years of Solitude','Gabriel García Márquez','','classics','',4.0,28.09,'https://images.gr-assets.com/books/1327881361m/320.jpg',555),
(95,'The Picture of Dorian Gray','Oscar Wilde','','classics','',4.1,18.46,'https://images.gr-assets.com/books/1424596966m/5297.jpg',2303),
(96,'Fifty Shades Freed','E.L. James','','novel','',3.9,29.77,'https://images.gr-assets.com/books/1336418837m/13536860.jpg',133),
(97,'Dracula','Bram Stoker','','classics','',4.0,8.10,'https://images.gr-assets.com/books/1387151694m/17245.jpg',2207),
(98,'The Girl Who Played with Fire','Stieg Larsson','','novel','',4.2,22.35,'https://images.gr-assets.com/books/1351778881m/5060378.jpg',209),
(99,'Fifty Shades Darker','E.L. James','','novel','',3.9,9.20,'https://images.gr-assets.com/books/1358266080m/11857408.jpg',147);

INSERT INTO testdb.bookshelf_order
(id,user_id,t_stamp,amount)
VALUES
(1,1,'2021-04-21 00:51:40',34.31),
(2,1,'2021-04-21 00:52:14',99.70),
(3,2,'2021-04-21 00:54:22',82.19),
(4,2,'2021-04-21 00:54:50',169.23),
(5,3,'2021-04-21 00:55:43',180.69),
(6,3,'2021-04-21 00:56:10',90.42),
(7,4,'2021-04-21 00:58:11',17.39),
(8,5,'2021-04-21 00:59:31',156.18),
(9,5,'2021-04-21 01:00:19',49.10);

INSERT INTO testdb.bookshelf_order_line
(id,order_id,order_line_number,book_id,quantity)
VALUES
(1,1,1,39,1),
(2,1,2,31,1),
(3,1,3,47,1),
(4,2,1,40,1),
(5,2,2,78,1),
(6,2,3,34,1),
(7,3,1,25,1),
(8,3,2,27,1),
(9,3,3,24,1),
(10,4,1,25,1),
(11,4,2,27,1),
(12,4,3,24,1),
(13,4,4,49,1),
(14,4,5,3,1),
(15,4,6,56,1),
(16,5,1,25,1),
(17,5,2,27,1),
(18,5,3,24,1),
(19,5,4,49,1),
(20,5,5,3,1),
(21,5,6,56,1),
(22,5,7,4,1),
(23,6,1,46,1),
(24,6,2,57,1),
(25,6,3,38,1),
(26,7,1,85,1),
(27,8,1,78,1),
(28,8,2,67,1),
(29,8,3,22,1),
(30,8,4,38,1),
(31,9,1,4,1),
(32,9,2,7,1),
(33,9,3,65,1);
