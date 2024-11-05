-- \c assignment4
-- \i [filepath]\4_2.sql

drop table users;
drop table channels;
drop table chats;
drop table follows;
drop table blocks;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    profile_picture_url VARCHAR(255),
    status_message VARCHAR(255),
    is_deleted BOOLEAN DEFAULT FALSE,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE channels (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_by_user_id INT REFERENCES users(id) ON DELETE CASCADE,
    channel_url VARCHAR(255),
    max_members INT,
    is_deleted BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    sender_id INT REFERENCES users(id) ON DELETE CASCADE,
    channel_id INT REFERENCES channels(id) ON DELETE CASCADE,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE follows (
    id SERIAL PRIMARY KEY,
    follower_id INT REFERENCES users(id) ON DELETE CASCADE,
    followee_id INT REFERENCES users(id) ON DELETE CASCADE,
    follow_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_follow UNIQUE (follower_id, followee_id)
);

CREATE TABLE blocks (
    id SERIAL PRIMARY KEY,
    blocker_id INT REFERENCES users(id) ON DELETE CASCADE,
    blocked_id INT REFERENCES users(id) ON DELETE CASCADE,
    block_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_block UNIQUE (blocker_id, blocked_id)
);