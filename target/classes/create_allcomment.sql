/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  WANG Weiran
 * Created: 2022-4-15
 */

CREATE TABLE allcomment (
    username VARCHAR(50) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
);
INSERT INTO allcomment VALUES ('asd', '123');
INSERT INTO allcomment VALUES ('cxz', '1234');