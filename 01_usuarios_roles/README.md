# Actividad 4: Principio de Mínimo Privilegio

## ¿Por qué no es adecuado asignar `db_owner` al vendedor o al analista?
El rol `db_owner` otorga control total sobre la base de datos, lo que permite realizar modificaciones de esquema, eliminar tablas, otorgar/revocar permisos e incluso eliminar la base de datos completa.

1. **Vendedor:** Solo requiere consultar y registrar transacciones diarias (clientes y reservas). Otorgarle `db_owner` comprometería la integridad de la base de datos, permitiéndole borrar historial o modificar estructuras de tablas intencionalmente o por error.

2. **Analista:** Su función es puramente de lectura y generación de reportes. Un analista con `db_owner` podría alterar registros contables o eliminar datos financieros esenciales para la toma de decisiones.

Aplicar el **Principio de Mínimo Privilegio** garantiza que cada usuario o rol cuente únicamente con los accesos estrictamente necesarios para cumplir con sus funciones, reduciendo vectores de ataque y errores humanos.

-- 1. Consulta permitida (Lectura de datos)
SELECT TOP 5 * FROM EACM.pago;

-- 2. Intento de modificación (Denegado por SQL Server)
INSERT INTO EACM.pago (id_reserva, monto, fecha_pago, medio_pago)
VALUES (1, 150.00, '2026-10-02', 'Tarjeta');