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

-- create_votecomment.sql
CREATE TABLE votecomment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- create_comment.sql
CREATE TABLE comment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- create_allcomment.sql
CREATE TABLE allcomment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);







