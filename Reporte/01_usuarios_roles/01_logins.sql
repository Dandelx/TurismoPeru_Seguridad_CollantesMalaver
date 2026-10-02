USE master;
GO

-- Login para Administrador
CREATE LOGIN EACM_admin 
WITH PASSWORD = 'Admin#Password2026!', 
     DEFAULT_DATABASE = TURISMOPERU_EACM;
GO

-- Login para Vendedor
CREATE LOGIN EACM_vendedor 
WITH PASSWORD = 'Vendedor#Password2026!', 
     DEFAULT_DATABASE = TURISMOPERU_EACM;
GO

-- Login para Analista
CREATE LOGIN EACM_analista 
WITH PASSWORD = 'Analista#Password2026!', 
     DEFAULT_DATABASE = TURISMOPERU_EACM;
GO
