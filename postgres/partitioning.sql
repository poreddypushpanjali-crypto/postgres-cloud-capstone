CREATE TABLE order_events (
    event_id BIGSERIAL,
    order_id BIGINT NOT NULL,
    event_time TIMESTAMPTZ NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    payload JSONB DEFAULT '{}'::jsonb
) PARTITION BY RANGE (event_time);

CREATE TABLE order_events_2026_h1
PARTITION OF order_events
FOR VALUES FROM ('2026-01-01') TO ('2026-07-01');

CREATE TABLE order_events_2026_h2
PARTITION OF order_events
FOR VALUES FROM ('2026-07-01') TO ('2027-01-01');

CREATE INDEX idx_events_h1_time
ON order_events_2026_h1(event_time);

CREATE INDEX idx_events_h2_time
ON order_events_2026_h2(event_time);
