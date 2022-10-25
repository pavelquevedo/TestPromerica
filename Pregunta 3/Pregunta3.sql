--A
SELECT 
	p.NOMBRE AS 'PROYECTO', 
	pr.DESCRIPCION AS 'PRODUCTO'
FROM PRODUCTO_PROYECTO pp 
	INNER JOIN PROYECTO p ON pp.PROYECTO = p.PROYECTO
	INNER JOIN PRODUCTO pr ON pp.PRODUCTO = pr.PRODUCTO
	
	
--B
SELECT 
	p.DESCRIPCION AS 'PRODUCTO',
	pr.NOMBRE AS 'PROYECTO',
	fm.NOMBRE AS 'MENSAJE',
	fm.ASUNTO,
	fm.REMITENTE
FROM MENSAJE m 
INNER JOIN PRODUCTO_PROYECTO pp ON m.PRODUCTO = pp.PRODUCTO AND m.PROYECTO = pp.PROYECTO
INNER JOIN PRODUCTO p ON pp.PRODUCTO = p.PRODUCTO
INNER JOIN PROYECTO pr ON pp.PROYECTO = pp.PROYECTO
INNER JOIN FORMATO_MENSAJE fm ON m.COD_FORMATO = fm.COD_FORMATO


--C
DECLARE @CountProductos INT 
SET @CantidadProductos = (SELECT COUNT(1) FROM PRODUCTO)

SELECT
	PR.NOMBRE AS 'PROYECTO'
	IIF(COUNT(pp.PRODUCTO) = @CountProductos, 'TODOS', fm.ASUNTO) AS 'MENSAJE'
FROM MENSAJE m 
INNER JOIN PRODUCTO_PROYECTO pp ON m.PRODUCTO = pp.PRODUCTO AND m.PROYECTO = pp.PROYECTO
INNER JOIN PRODUCTO p ON pp.PRODUCTO = p.PRODUCTO
INNER JOIN PROYECTO pr ON pp.PROYECTO = pr.PROYECTO
INNER JOIN FORMATO_MENSAJE fm ON m.COD_FORMATO = fm.COD_FORMATO
GROUP BY pp.PROYECTO, fm.ASUNTO

--Esta consulta también podría tener otro enfoque, por ejemplo, podría hacerse una tabla temporal
--en la que se obtengan los mensajes que están en todos los productos de un proyecto, pero dependiendo
--de la cantidad de registros, podría llegar a tener problemas de rendimiento.	


--Favor tomar en consideración que estas consultas no fueron ejecutadas en ningún ambiente, 
-- pues no tuve tiempo de replicar la base de datos en mi ambiente local.
	