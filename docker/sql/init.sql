-- Create the users table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
                                     id SERIAL PRIMARY KEY,
                                     username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
    );
