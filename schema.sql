-- Product Analytics & Business Insights (SQL)
-- Target dialect: PostgreSQL 13+ (should be mostly portable)

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id        INTEGER PRIMARY KEY,
  signup_date    DATE NOT NULL,
  country        TEXT NOT NULL
);

CREATE TABLE events (
  event_id       BIGSERIAL PRIMARY KEY,
  user_id        INTEGER NOT NULL REFERENCES users(user_id),
  event_type     TEXT NOT NULL,          -- 'signup', 'login', 'view_product', 'add_to_cart', 'checkout', 'purchase', 'feature_x'
  event_time     TIMESTAMP NOT NULL,
  session_id     TEXT NOT NULL
);

CREATE TABLE subscriptions (
  subscription_id BIGSERIAL PRIMARY KEY,
  user_id         INTEGER NOT NULL REFERENCES users(user_id),
  plan            TEXT NOT NULL,          -- 'free', 'starter', 'pro', 'enterprise'
  start_date      DATE NOT NULL,
  end_date        DATE,                   -- NULL = active
  status          TEXT NOT NULL            -- 'active', 'canceled', 'expired'
);

CREATE TABLE payments (
  payment_id     BIGSERIAL PRIMARY KEY,
  user_id        INTEGER NOT NULL REFERENCES users(user_id),
  amount         NUMERIC(10,2) NOT NULL,
  payment_date   DATE NOT NULL,
  method         TEXT NOT NULL             -- 'card', 'paypal', 'invoice'
);

-- Helpful indexes
CREATE INDEX idx_events_user_time ON events(user_id, event_time);
CREATE INDEX idx_events_type_time ON events(event_type, event_time);
CREATE INDEX idx_payments_user_date ON payments(user_id, payment_date);
CREATE INDEX idx_subs_user_dates ON subscriptions(user_id, start_date, end_date);
