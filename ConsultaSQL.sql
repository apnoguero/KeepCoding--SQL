	
-------------

-- Consulta SQL: 
-- Nombre modelo, marca y grupo de coches (los nombre de todos)
-- Fecha de compra
-- Matricula
-- Nombre del color del coche
-- Total kilómetros
-- Nombre empresa que esta asegurado el coche
-- Numero de póliza
	
SELECT mo.modelo, m.marca, g.empresa, c.fecha_compra, c.matricula, col.descripcion_color, c.km_total, e.compania_aseguradora, p.num_poliza
	FROM keepcoches.grupoempresarial g
	JOIN keepcoches.marca m ON m.id_empresa = g.id_empresa  
	JOIN keepcoches.modelo mo ON mo.id_marca = m.id_marca 
	JOIN keepcoches.coches c ON c.id_modelo = mo.id_modelo
	JOIN keepcoches.color col ON c.id_color = col.id_color 
	JOIN keepcoches.polizacoche p ON p.id_coche = c.id_coche
	JOIN keepcoches.empresaaseguradora e ON e.id_companiaaseg = p.id_companiaaseg 
	;
	

