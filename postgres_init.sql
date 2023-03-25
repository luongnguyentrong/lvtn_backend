CREATE DATABASE keycloak;
CREATE USER keycloak WITH PASSWORD 'Wjd4nw37wJu9bAsvBv3Mn8byew7URykL';
GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;

\c keycloak
GRANT USAGE, CREATE ON SCHEMA public to keycloak;