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





