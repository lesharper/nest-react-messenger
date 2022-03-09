CREATE DATABASE nchat;

-- Создание таблиц

CREATE TABLE  users (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(300) NOT NULL,
    avatar TEXT
);

CREATE TABLE discussions (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL,
    password VARCHAR(35) DEFAULT NULL,
    description TEXT,
    anonymous BOOLEAN NOT NULL,
    poster TEXT
);

CREATE TABLE users_discussion (
    user_id INTEGER NOT NULL,
    discussion_id INTEGER NOT NULL,
    creator BOOLEAN NOT NULL,
    PRIMARY KEY(user_id, discussion_id),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (discussion_id) REFERENCES discussions (id) ON DELETE CASCADE
);

CREATE TABLE messages (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    date_send TIMESTAMP NOT NULL,
    message_body TEXT NOT NULL,
    image TEXT,
    user_id INTEGER NOT NULL,
    discussion_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (discussion_id) REFERENCES discussions (id) ON DELETE CASCADE
);

-- CREATE TABLE creators_discussions (
--     user_id INTEGER,
--     discussion_id INTEGER NOT NULL,
--     FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
--     FOREIGN KEY (discussion_id) REFERENCES discussions (id) ON DELETE CASCADE
-- );

mock
{
INSERT INTO discussions (title, password, anonymous, description, poster) VALUES ('Разработка', 'qwerty', false, 'Чат посвященный разработке', 'qwerfreter.jpg');
INSERT INTO discussions (title, password, anonymous, description, poster) VALUES ('Английский', '123456', false, 'Чат посвященный разработке', 'qwerfreter.jpg');
INSERT INTO discussions (title, password, anonymous, description, poster) VALUES ('Общение!', null, true, 'Заходите и общайтесь, чат анонимный!)', 'sdaa11sda.jpg');
INSERT INTO discussions (title, password, anonymous, description, poster) VALUES ('Учеба', 'qwerty', false, 'Чат посвященный выдаче расписания и дз', '3433фффф.jpg');
INSERT INTO discussions (title, password, anonymous, description, poster) VALUES ('ПКС-18-1', null, false, 'Беседа для ПКС-18-1', '3433.jpg');
}





