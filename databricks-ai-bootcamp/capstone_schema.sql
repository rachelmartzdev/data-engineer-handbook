-- Capstone Lakebase schema — run this once against your postgres-vector
-- Lakebase database before running 03_gold_output.py, same way you ran
-- weather_schema.sql for Assignment 2 (paste into a notebook %sql cell, or
-- run via psycopg2 in a notebook cell — whichever you did last time).

CREATE TABLE IF NOT EXISTS providers (
    npi            TEXT PRIMARY KEY,
    display_name   TEXT,
    credential     TEXT,
    taxonomy_code  TEXT,
    taxonomy_desc  TEXT,
    address_line   TEXT,
    city           TEXT,
    state          TEXT,
    zip5           TEXT,
    phone          TEXT,
    synced_at      TIMESTAMP DEFAULT now()
);

CREATE TABLE IF NOT EXISTS provider_zip_counts (
    zip5            TEXT PRIMARY KEY,
    provider_count  INTEGER,
    synced_at       TIMESTAMP DEFAULT now()
);

-- Added by Phase 2 (embeddings) and Phase 4 (confirmation agent) later —
-- not needed yet, just previewing what's coming:
--
-- CREATE TABLE provider_embeddings (
--     id             SERIAL PRIMARY KEY,
--     npi            TEXT REFERENCES providers(npi),
--     chunk_text     TEXT,
--     embedding      vector(384),
--     model_name     TEXT,
--     created_at     TIMESTAMP DEFAULT now()
-- );
--
-- CREATE TABLE provider_confirmations (
--     id              SERIAL PRIMARY KEY,
--     npi             TEXT REFERENCES providers(npi),
--     status          TEXT,       -- 'confirmed_current' or 'flagged_outdated'
--     note            TEXT,
--     confirmed_by    TEXT,       -- who/what triggered it (e.g. 'agent')
--     confirmed_at    TIMESTAMP DEFAULT now()
-- );
