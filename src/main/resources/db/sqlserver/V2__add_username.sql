ALTER TABLE queries
ADD user_name VARCHAR(256);

ALTER TABLE queries
ADD user_original VARCHAR(256);

ALTER TABLE queries
ADD server_version VARCHAR(256);

ALTER TABLE queries
ADD enabled_roles NVARCHAR(MAX);

ALTER TABLE queries
ADD groups NVARCHAR(MAX);

ALTER TABLE queries
ADD principal VARCHAR(256);

CREATE INDEX idx_queries_user_name ON queries (user_name);