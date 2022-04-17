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
                         FOREIGN KEY (username) REFERENCES users(username),
                         FOREIGN KEY (question) REFERENCES vote(question)


);

INSERT INTO vote VALUES ('have a nice day?');
INSERT INTO vote_mc(question, mc) VALUES ('have a nice day?', 'good');
INSERT INTO vote_mc(question, mc) VALUES ('have a nice day?', 'bad');
INSERT INTO vote_mc(question, mc) VALUES ('have a nice day?', 'sad');
INSERT INTO vote_mc(question, mc) VALUES ('have a nice day?', 'no sure');
DELETE FROM NBUSER.VOTE WHERE QUESTION = 'have a nice day?';



