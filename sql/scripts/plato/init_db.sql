CREATE ROLE concerto WITH LOGIN PASSWORD 'Vinyl123!';
COMMENT ON ROLE concerto IS 'Mother company of Concerto and Plato ';


CREATE ROLE concerto_read_only WITH NOINHERIT;
GRANT concerto_read_only TO concerto;


CREATE DATABASE plato WITH OWNER concerto;
ALTER DATABASE plato SET plpgsql.extra_warnings TO 'all';
ALTER DATABASE plato SET plpgsql.extra_errors TO 'all';

\connect plato

ALTER SCHEMA public OWNER TO concerto;

SET ROLE concerto;

CREATE EXTENSION IF NOT EXISTS INTARRAY WITH SCHEMA public;
CREATE EXTENSION IF NOT EXISTS CITEXT WITH SCHEMA public;
CREATE EXTENSION IF NOT EXISTS HSTORE WITH SCHEMA public;

CREATE SCHEMA IF NOT EXISTS pl;
CREATE SCHEMA IF NOT EXISTS pl_admin;

GRANT USAGE ON SCHEMA pl TO concerto_read_only;
COMMENT ON SCHEMA pl IS 'Main Plato relations';

ALTER DATABASE plato SET search_path TO "$user",public,pl;

--
-- Default permissions
--
ALTER DEFAULT PRIVILEGES FOR ROLE concerto IN SCHEMA pl
GRANT SELECT ON TABLES TO concerto_read_only;

ALTER DEFAULT PRIVILEGES FOR ROLE concerto IN SCHEMA pl
GRANT USAGE ON SEQUENCES TO concerto_read_only;
