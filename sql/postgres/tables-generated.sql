-- This file is automatically generated using maintenance/generateSchemaSql.php.
-- Source: sql/tables.json
-- Do not modify this file directly.
-- See https://www.mediawiki.org/wiki/Manual:Schema_changes
CREATE TABLE importdump_requests (
  request_id BIGSERIAL NOT NULL,
  request_actor BIGINT NOT NULL,
  request_timestamp TIMESTAMPTZ NOT NULL,
  request_source VARCHAR(255) NOT NULL,
  request_target VARCHAR(64) NOT NULL,
  request_reason TEXT NOT NULL,
  request_status TEXT NOT NULL,
  request_locked SMALLINT DEFAULT 0 NOT NULL,
  request_private SMALLINT DEFAULT 0 NOT NULL,
  PRIMARY KEY(request_id)
);

CREATE INDEX request_actor_timestamp ON importdump_requests (
  request_actor, request_timestamp
);

CREATE INDEX request_timestamp ON importdump_requests (request_timestamp);

CREATE INDEX request_target ON importdump_requests (request_target);

CREATE INDEX request_status ON importdump_requests (request_status);


CREATE TABLE importdump_request_comments (
  request_comment_id BIGSERIAL NOT NULL,
  request_id BIGINT NOT NULL,
  request_comment_actor BIGINT NOT NULL,
  request_comment_timestamp TIMESTAMPTZ NOT NULL,
  request_comment_text TEXT NOT NULL,
  PRIMARY KEY(request_comment_id)
);

CREATE INDEX request_id ON importdump_request_comments (request_id);

CREATE INDEX request_comment_timestamp ON importdump_request_comments (request_comment_timestamp);
