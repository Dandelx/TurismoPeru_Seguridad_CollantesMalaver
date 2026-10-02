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