-- ============================================================
--  Creazione Database ferrovia con utenza ferrovia_user_admin
-- ============================================================

CREATE DATABASE ferrovia WITH TEMPLATE = template0   ENCODING 'UTF8'  LC_COLLATE = 'en_US.utf8'  LC_CTYPE = 'en_US.utf8';
CREATE USER ferrovia_user_admin WITH PASSWORD 'ferrovia_user_admin_psw!';
ALTER DATABASE ferrovia OWNER TO ferrovia_user_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ferrovia_user_admin;