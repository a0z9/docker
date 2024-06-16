create database IF NOT EXISTS library;

SET character_set_client = utf8;

CREATE TABLE IF NOT EXISTS library.books (
  id int(11) NOT NULL AUTO_INCREMENT,
  author varchar(100) NOT NULL,
  title varchar(100) NOT NULL,
  isbn varchar(40) NOT NULL DEFAULT 'ISBN 987-5-496-03214-8',
  year varchar(4) DEFAULT NULL,
  PRIMARY KEY (id),
  record_created timestamp not null default current_timestamp()
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO library.books(author,title,isbn,year) 
VALUES ('Jack London','White silence','ISBN 987-5-496-03214-5','1943'),('Jack London','Martin Eden','ISBN 987-5-496-03214-8','1963'),('Alexei Tolstoi','Aelita','ISBN 821-5-753-12345-9','1987');
