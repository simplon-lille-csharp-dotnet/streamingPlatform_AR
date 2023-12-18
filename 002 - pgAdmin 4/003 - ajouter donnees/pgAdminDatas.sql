INSERT INTO Director(firstname, lastname) VALUES
('Katherina', 'Knightley'),
('Ludvig', 'Gillings'),
('Latrina', 'Moxley'),
('John', 'Doe');

INSERT INTO Actor(firstname, lastname, birthdate) VALUES
('Valentin', 'Barette','1973-06-25'),
('Nollie', 'Rostron','1987-04-07'),
('Chrissie', 'McNicol','1965-05-06'),
('Wolf', 'Phelips','2006-12-28'),
('Andee', 'Rostron','1985-07-02'),
('Chrissie', 'Wateiko','1988-09-30');

INSERT INTO Users(email, password) VALUES
('gneave0@marketwatch.com', 'cC3*+\yr#G""Azb7p'),
('gmcmullen1@themeforest.net', 'wT3?V~3|8mzv'),
('mtigwell2@geocities.jp', 'oA2\yI@si'),
('swandrich3@netlog.com', 'uY4+A_n5e'),
('dgammett4@wikipedia.org', 'vG9#J8d8@&o5QEl');

INSERT INTO Movie(title, duration, release_year, FK_DirectorID) VALUES
('Hiroshima', '120','2006', '1'),
('Caged Heat', '90','1998','2'),
('Color of Night', '130','2002','4'),
('Eyes of a Stranger', '86','2005', '1'),
('Youre a Good Man, Charlie Brown', '115','1998', '2'),
('Half Past Dead', '78','1993', '3');

INSERT INTO Movie_Actor(FK_MovieID, FK_ActorID, role, is_lead_role) VALUES
('1', '1','main', '1'),
('2', '4','figurant','0'),
('2', '3','figurant','0'),
('1', '2','main', '1'),
('4', '2','main', '1'),
('4', '3','main', '1'),
('4', '1','figurant', '0'),
('3', '5','figurant', '0');

INSERT INTO favorite(FK_UserID, FK_MovieID) VALUES
('1', '1'),
('2', '4'),
('2', '3'),
('3', '1'),
('4', '2'),
('5', '5');