-- create_users.sql
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE user_roles (
    user_role_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);

INSERT INTO users VALUES ('tony', '{noop}tonypw', 'Tony Wang', '81438428', 'HKMU');
INSERT INTO user_roles(username, role) VALUES ('tony', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('tony', 'ROLE_ADMIN');

INSERT INTO users VALUES ('john', '{noop}johnpw', 'John Li', '12345678', 'OUHK');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_ADMIN');

INSERT INTO users VALUES ('mary', '{noop}marypw', 'Mary Shi', '87654321', 'HKMU');
INSERT INTO user_roles(username, role) VALUES ('mary', 'ROLE_USER');


-- create_lectures.sql
CREATE TABLE lecture (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    lecture_title VARCHAR(255) NOT NULL,
    lecturer VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO lecture(lecture_title, lecturer) VALUES ('Overview of Web Applications', 'john');
INSERT INTO lecture(lecture_title, lecturer) VALUES ('Servlet', 'john');
INSERT INTO lecture(lecture_title, lecturer) VALUES ('JSP,JavaBean', 'john');

CREATE TABLE attachment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    file_type VARCHAR(255) DEFAULT NULL,
    lecture_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (lecture_id) REFERENCES lecture(id)
);


-- create_votes.sql
CREATE TABLE vote (
    question VARCHAR(50) NOT NULL,
    PRIMARY KEY (question)
);

CREATE TABLE vote_mc (
    vote_mc_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    question VARCHAR(50) NOT NULL,
    mc VARCHAR(50) NOT NULL,
    count INTEGER  DEFAULT 0,
    PRIMARY KEY (vote_mc_id),
    FOREIGN KEY (question) REFERENCES vote(question)
);

CREATE TABLE user_mc (
    user_mc_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    question VARCHAR(50) NOT NULL,
    mc VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_mc_id),
    FOREIGN KEY (question) REFERENCES vote(question)
);

INSERT INTO vote VALUES ('Have a nice day?');
INSERT INTO vote_mc(question, mc) VALUES ('Have a nice day?','Yes');
INSERT INTO vote_mc(question, mc) VALUES ('Have a nice day?','No');
INSERT INTO vote_mc(question, mc) VALUES ('Have a nice day?','Not sure');
INSERT INTO vote_mc(question, mc) VALUES ('Have a nice day?','None of the above');

INSERT INTO vote VALUES ('Do you like LOL or Apex?');
INSERT INTO vote_mc(question, mc) VALUES ('Do you like LOL or Apex?','LOL');
INSERT INTO vote_mc(question, mc) VALUES ('Do you like LOL or Apex?','Apex');
INSERT INTO vote_mc(question, mc) VALUES ('Do you like LOL or Apex?','Both');
INSERT INTO vote_mc(question, mc) VALUES ('Do you like LOL or Apex?','None of the above');

INSERT INTO vote VALUES ('Do you prefer JAVA or Python?');
INSERT INTO vote_mc(question, mc) VALUES ('Do you prefer JAVA or Python?','JAVA');
INSERT INTO vote_mc(question, mc) VALUES ('Do you prefer JAVA or Python?','Python');
INSERT INTO vote_mc(question, mc) VALUES ('Do you prefer JAVA or Python?','Both');
INSERT INTO vote_mc(question, mc) VALUES ('Do you prefer JAVA or Python?','None of the above');

-- create_votecomment.sql
CREATE TABLE votecomment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO votecomment(username, comment) VALUES ('tony', 'Hello!');
INSERT INTO votecomment(username, comment) VALUES ('mary', 'Hi!');

-- create_comment.sql
CREATE TABLE comment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO comment(username, comment) VALUES ('tony', 'Welcome to this lecture!');
INSERT INTO comment(username, comment) VALUES ('mary', 'Hello everyone!');

-- create_allcomment.sql
CREATE TABLE allcomment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO allcomment(username, comment) VALUES ('tony', 'Welcome to this lecture!');
INSERT INTO allcomment(username, comment) VALUES ('mary', 'Hello everyone!');
INSERT INTO allcomment(username, comment) VALUES ('tony', 'Hello!');
INSERT INTO allcomment(username, comment) VALUES ('mary', 'Hi!');







