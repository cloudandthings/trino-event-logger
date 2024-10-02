ALTER TABLE queries
ADD COLUMN user_name VARCHAR(256);

ALTER TABLE queries
ADD COLUMN user_original VARCHAR(256);

ALTER TABLE queries
ADD COLUMN server_version VARCHAR(256);

ALTER TABLE queries
ADD COLUMN enabled_roles TEXT;

ALTER TABLE queries
ADD COLUMN groups TEXT;

ALTER TABLE queries
ADD COLUMN principal VARCHAR(256);

CREATE INDEX idx_queries_user_name ON queries (user_name);