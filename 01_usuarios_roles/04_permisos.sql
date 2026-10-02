USE TURISMOPERU_EACM;
GO

-- 1. Asignar usuarios a sus respectivos roles
ALTER ROLE db_owner ADD MEMBER EACM_admin;
ALTER ROLE rol_vendedor ADD MEMBER EACM_vendedor;
ALTER ROLE rol_analista ADD MEMBER EACM_analista;
GO

-- 2. Permisos para rol_vendedor

-- Permisos PERMITIDOS (SELECT e INSERT)
GRANT SELECT, INSERT ON EACM.cliente TO rol_vendedor;
GRANT SELECT, INSERT ON EACM.reserva TO rol_vendedor;
GRANT SELECT ON EACM.alojamiento TO rol_vendedor;
GRANT SELECT ON EACM.habitacion TO rol_vendedor;

-- Permisos DENEGADOS explícitamente (DELETE)
DENY DELETE ON EACM.cliente TO rol_vendedor;
DENY DELETE ON EACM.reserva TO rol_vendedor;
GO

-- 3. Permisos para rol_analista

-- Solo SELECT en las tablas indicadas
GRANT SELECT ON EACM.cliente TO rol_analista;
GRANT SELECT ON EACM.reserva TO rol_analista;
GRANT SELECT ON EACM.pago TO rol_analista;
GRANT SELECT ON EACM.alojamiento TO rol_analista;
GRANT SELECT ON EACM.habitacion TO rol_analista;
GRANT SELECT ON EACM.paquete TO rol_analista;
GRANT SELECT ON EACM.lugar_turistico TO rol_analista;

-- Denegar INSERT, UPDATE y DELETE
DENY INSERT, UPDATE, DELETE ON SCHEMA::EACM TO rol_analista;
GO