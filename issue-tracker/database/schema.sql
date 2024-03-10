CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE complaints (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    latitude TEXT NOT NULL,
    longitude TEXT NOT NULL,
    issued_at TIMESTAMP NOT NULL DEFAULT NOW(),
    issuer_id UUID NOT NULL REFERENCES users,
    solved_at TIMESTAMP NOT NULL
);

CREATE TABLE public_servant (
    user_id UUID NOT NULL REFERENCES users,
    employer TEXT NOT NULL
);

CREATE TABLE assignments (
    user_id UUID NOT NULL REFERENCES users,
    complaint_id UUID NOT NULL REFERENCES complaints,
    forcasted_due_date TIMESTAMP NOT NULL
);

CREATE TABLE images (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    complaint_id UUID NOT NULL REFERENCES complaints,
    image_url TEXT NOT NULL
);