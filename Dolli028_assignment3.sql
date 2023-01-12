DROP TABLE IF EXISTS casting;
DROP TABLE IF EXISTS actor;
DROP TABLE IF EXISTS movie;
CREATE TABLE Movie(
	movieId int,
	title TEXT,
	yearMade int,
	score int,
	director TEXT,
	PRIMARY KEY (movieId)
);
CREATE TABLE Actor(
	actorId int,
	actorName TEXT,
	PRIMARY KEY (actorId)
);
CREATE TABLE Casting(
	movieId int,
	actorId int,
	PRIMARY KEY (movieId,actorId),
	FOREIGN KEY (movieId) REFERENCES Movie(movieId),
	FOREIGN KEY (actorId) REFERENCES Actor(actorId)
);
INSERT INTO actor(actorid,actorname)
VALUES(
	1,'Danny Devito'),
	(2,'Amy Adams'),
	(3,'Sandra Bullock'),
	(4,'Halle Berry'),
	(5,'Brad Pitt'),
	(6,'Tom Hanks'),
	(7,'Leo Decaprio'),
	(8,'Matthew McConaughey');
INSERT INTO movie(movieid,title,yearmade,score,director)
VALUES(
	1010,'Shawshank Redemption',1998,9,'Chaplin Charles'),
	(1111,'No Its Me',2013,8,'Jeff Scott'),
	(1212,'Smile',1999,7,'Jane Doe'),
	(1313,'Scooby Doo',2012,8,'Raja Gosnell'),
	(1414,'Minons 12',2022,10,'Jack Deer'),
	(1515,'Halloween',2012,6,'Johny Mann'),
	(1616,'Top Gun',2021,9,'Tom Cruise'),
	(1717,'Who Knew?',1999,3,'Jeff Scott'),
	(1818,'You Are Here',1985,5,'Chaplin Charles'),
	(1919,'Now It Is Time',1997,10,'Chaplin Charles');
INSERT INTO casting(movieid,actorid)
VALUES(
	1010,1),
	(1010,4),
	(1010,7),
	(1111,6),
	(1212,3),
	(1313,2),
	(1414,8),
	(1515,5),
	(1616,7),
	(1717,1),
	(1818,2),
	(1818,4),
	(1818,7),
	(1919,3),
	(1919,4),
	(1919,7);

SELECT actorName 
FROM Actor
LEFT JOIN Casting
ON Casting.actorid = Actor.actorid
LEFT JOIN Movie 
ON Movie.movieid = Casting.movieid
WHERE Movie.director = 'Chaplin Charles'
GROUP BY actorName
HAVING COUNT(Actor.actorid) = (SELECT COUNT(*) AS MaxMovies 
FROM Movie
WHERE Movie.director = 'Chaplin Charles')
ORDER BY COUNT(*);


SELECT actorName 
FROM Actor
LEFT JOIN Casting
ON Casting.actorid = Actor.actorid
LEFT JOIN Movie 
ON Movie.movieid = Casting.movieid
WHERE Movie.director = 'Chaplin Charles'
GROUP BY actorName;

SELECT actorName
FROM Actor
LEFT JOIN Casting 
On Casting.actorid = Actor.actorid
LEFT JOIN Movie 
On movie.movieid = Casting.movieid
WHERE Movie.director = 'Chaplin Charles'
GROUP BY actorName
HAVING COUNT(Actor.actorid) = 1; 
