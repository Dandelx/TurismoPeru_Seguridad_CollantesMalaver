USE TURISMOPERU_EACM;
GO
-- PARTE 2: IMPORTACIÓN Y EXPORTACIÓN BCP

-- 1. COMANDOS DE EXPORTACIÓN (BCP OUT / QUERYOUT)
-- Ejecutados en CMD para generar los archivos .csv:
/*
bcp "SELECT * FROM TURISMOPERU_EACM.EACM.cliente" queryout "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\clientes.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
bcp "SELECT * FROM TURISMOPERU_EACM.EACM.reserva" queryout "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\reservas.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
bcp "SELECT * FROM TURISMOPERU_EACM.EACM.pago" queryout "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\pago.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
bcp "SELECT * FROM TURISMOPERU_EACM.EACM.lugar_turistico" queryout "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\lugaresturtisticos.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
*/

-- 2. COMANDOS DE IMPORTACIÓN ESTRATÉGICA (BCP IN)
-- Comandos para importar los datos desde los archivos .csv hacia la base de datos:
/*
bcp TURISMOPERU_EACM.EACM.cliente in "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\clientes.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
bcp TURISMOPERU_EACM.EACM.reserva in "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\reservas.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
bcp TURISMOPERU_EACM.EACM.pago in "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\pago.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
bcp TURISMOPERU_EACM.EACM.lugar_turistico in "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\lugaresturtisticos.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
*/

-- ACTIVIDAD 5: IMPORTACIÓN MEDIANTE TABLA DE STAGING (EACM.cliente_importacion)

-- 1. CREACIÓN DE LA TABLA TEMPORAL / STAGING
IF OBJECT_ID('EACM.cliente_importacion', 'U') IS NOT NULL
    DROP TABLE EACM.cliente_importacion;
GO

CREATE TABLE EACM.cliente_importacion (
    numero_documento VARCHAR(20),
    nombres          VARCHAR(100),
    apaterno         VARCHAR(100),
    amaterno         VARCHAR(100)
);
GO

/*
-- 2. IMPORTAR LOS DATOS VÍA BCP HACIA LA TABLA DE STAGING
-- Ejecutar este comando en CMD:
bcp TURISMOPERU_EACM.EACM.cliente_importacion in "C:\Users\colla\Documents\TurismoPeru_Seguridad_CollantesMalaver\02_importacion_exportacion\clientes.csv" -c -t "," -r \n -S 161.132.54.162 -U estudiante -P Unc.2026 -C RAW -u
*/

-- 3. VALIDACIÓN DE REGISTROS
SELECT 
    numero_documento, 
    nombres, 
    apaterno, 
    amaterno 
FROM EACM.cliente_importacion;
GO

-- 4. IDENTIFICACIÓN DE REGISTROS DUPLICADOS
-- Muestra documentos duplicados en el archivo de importación o que ya existen en la base de datos
SELECT 
    numero_documento, 
    COUNT(*) AS total_repeticiones
FROM EACM.cliente_importacion
GROUP BY numero_documento
HAVING COUNT(*) > 1;
GO

-- 5. INSERTAR REGISTROS VÁLIDOS (Evitando duplicados con la tabla principal)
INSERT INTO EACM.persona (numero_documento, nombres, apaterno, amaterno)
SELECT DISTINCT 
    stg.numero_documento, 
    stg.nombres, 
    stg.apaterno, 
    stg.amaterno
FROM EACM.cliente_importacion stg
LEFT JOIN EACM.persona p ON stg.numero_documento = p.numero_documento
WHERE p.numero_documento IS NULL 
  AND stg.numero_documento IS NOT NULL;
GO