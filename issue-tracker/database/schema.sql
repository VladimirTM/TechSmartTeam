CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
DROP TABLE IF EXISTS images;
DROP TABLE IF EXISTS complaints;

CREATE TABLE user (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE user_session (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES user
);

CREATE TABLE complaints (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    latitude TEXT NOT NULL,
    longitude TEXT NOT NULL,
    issued_at TIMESTAMP NOT NULL DEFAULT NOW(),
    issue_id UUID NOT NULL REFERENCES user,
    solved_at TIMESTAMP NOT NULL
);

CREATE TABLE public_servant (
    user_id UUID NOT NULL REFERENCES user,
    employer TEXT NOT NULL
);

CREATE TABLE assignments (
    user_id UUID NOT NULL REFERENCES user,
    complaint_id UUID NOT NULL REFERENCES complaints,
    forcasted_due_date TIMESTAMP NOT NULL,
);

CREATE TABLE images (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    complaint_id UUID NOT NULL REFERENCES complaints,
    image_url TEXT NOT NULL
);