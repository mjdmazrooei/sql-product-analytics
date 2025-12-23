# Optional: Run on SQLite

The queries are written for PostgreSQL (best for window functions + generate_series).
If you want SQLite:
- Remove `generate_series` usage (use a calendar table)
- Replace `DATE_TRUNC` with `strftime` logic
- Replace `PERCENTILE_CONT` with an approximate percentile query

For a portfolio, PostgreSQL is recommended.
