CREATE TABLE IF NOT EXISTS cdc (
  id UUID NOT NULL,
  title STRING NOT NULL,
  CONSTRAINT pk PRIMARY KEY (id)
);

-- https://www.cockroachlabs.com/docs/stable/create-changefeed#kafka
-- CREATE CHANGEFEED FOR TABLE cdc INTO 'kafka://redpanda:9092' WITH UPDATED;
