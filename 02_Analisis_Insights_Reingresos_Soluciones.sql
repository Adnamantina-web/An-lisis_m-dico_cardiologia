use dm_cardiologia;




# ¿cuántas admisiones hay de media por mes? | fácil | subconsultas
SELECT 
    AVG(total_admisiones) AS media_total_admisiones
FROM (
    SELECT 
        MONTH(fecha_admision) AS mes,
        COUNT(*) AS total_admisiones
    FROM admisiones
    GROUP BY mes
) AS admisiones_por_mes;









# ¿y cuántos pacientes únicos de media por mes? | fácil | subconsultas
SELECT 
    AVG(total_pacientes) AS media_total_pacientes
FROM (
    SELECT 
        MONTH(fecha_admision) AS mes,
        COUNT(DISTINCT id_paciente) AS total_pacientes
    FROM admisiones
    GROUP BY mes
) AS pacientes_por_mes;









# ¿qué porcentaje de pacientes tienen más de un ingreso? | media | subconsultas
SELECT 
    (SUM(CASE WHEN total_reingresos > 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT id_paciente)) AS porcentaje_reingresos
FROM (
    SELECT id_paciente, COUNT(*) AS total_reingresos
    FROM admisiones
    GROUP BY id_paciente
) AS pacientes;









# ¿cual es el tiempo promedio entre una admisión y el siguiente reingreso? | avanzada | subconsultas | window functions
SELECT 
    AVG(dias_reingreso) AS tiempo_promedio_global_reingreso
FROM (
    SELECT 
        id_paciente,
        DATEDIFF(LEAD(fecha_admision) OVER (PARTITION BY id_paciente ORDER BY fecha_admision), fecha_admision) AS dias_reingreso
    FROM admisiones
) AS diferencias
WHERE dias_reingreso IS NOT NULL;



# ¿cuántas veces ingresan los pacientes? (cuántos pacientes una vez, cuántos 2 veces, etc) | media | subconsultas
SELECT 
    total_ingresos,
    COUNT(*) AS num_pacientes
FROM (
    SELECT 
        id_paciente,
        COUNT(*) AS total_ingresos
    FROM admisiones
    GROUP BY id_paciente
) AS ingresos_por_paciente
GROUP BY total_ingresos
ORDER BY total_ingresos;





# ¿cual es la media de ingresos de todos los pacientes? | avanzada | ctes
WITH ingresos_por_paciente AS (
    SELECT 
        id_paciente,
        COUNT(*) AS total_ingresos
    FROM admisiones
    GROUP BY id_paciente
),
distribucion_ingresos AS (
    SELECT 
        total_ingresos,
        COUNT(*) AS num_pacientes
    FROM ingresos_por_paciente
    GROUP BY total_ingresos
)
SELECT 
    SUM(total_ingresos * num_pacientes) * 1.0 / SUM(num_pacientes) AS media_ponderada
FROM distribucion_ingresos;









# ¿cual es la media de reingresos de los pacientes que han tenido reingresos? | media | subconsultas
SELECT 
    AVG(total_reingresos) AS media_reingresos
FROM (
    SELECT 
        id_paciente,
        COUNT(*) - 1 AS total_reingresos
    FROM admisiones
    GROUP BY id_paciente
    HAVING COUNT(*) > 1
) AS reingresos_por_paciente;









# ¿cuántos días de hospitalización supusieron los reingresos en el último año que tengamos completo? | media | subconsultas
SELECT 
    SUM(duracion_estancia) AS total_dias_reingresos
FROM admisiones
WHERE id_paciente IN (
    SELECT id_paciente 
    FROM admisiones 
    GROUP BY id_paciente 
    HAVING COUNT(*) > 1
)
AND YEAR(fecha_admision) = 2023;









# ¿cual es la duración promedio de la estancia de los pacientes que reingresan frente a los que no reingresan? | avanzada | ctes
WITH tipo_ingreso AS (
    SELECT 
        id_paciente,
        duracion_estancia,
        CASE 
            WHEN id_paciente IN (
                SELECT id_paciente 
                FROM admisiones 
                GROUP BY id_paciente 
                HAVING COUNT(*) > 1
            ) THEN 'reingreso'
            ELSE 'no_reingreso'
        END AS tipo_ingreso
    FROM admisiones
)
SELECT 
    tipo_ingreso,
    AVG(duracion_estancia) AS duracion_promedio_estancia
FROM tipo_ingreso
GROUP BY tipo_ingreso;









# ¿qué porcentaje de pacientes con reingreso terminan falleciendo? | pro | ctes
WITH pacientes_con_reingreso AS (
    SELECT id_paciente
    FROM admisiones
    GROUP BY id_paciente
    HAVING COUNT(*) > 1
),
total_pacientes_con_reingreso AS (
    SELECT COUNT(*) AS total_pacientes_reingreso
    FROM pacientes_con_reingreso
),
fallecidos_con_reingreso AS (
    SELECT COUNT(*) AS total_fallecidos_reingresos
    FROM admisiones
    WHERE resultado = 'Defuncion'
      AND id_paciente IN (SELECT id_paciente FROM pacientes_con_reingreso)
)
SELECT 
    (fcr.total_fallecidos_reingresos * 100.0 / tpcr.total_pacientes_reingreso) AS porcentaje_fallecidos_reingresos
FROM fallecidos_con_reingreso fcr, total_pacientes_con_reingreso tpcr;









# ¿cual es el promedio de edad de los pacientes que fallecen? | fácil | joins
SELECT 
    AVG(p.edad) AS edad_promedio_fallecidos
FROM pacientes p
JOIN admisiones a ON p.id_admision = a.id_admision
WHERE a.resultado = 'Defuncion';









# ¿fallecen proporcionalmente el mismo número de hombres y mujeres? | media | joins
select 
	p.genero,
    sum(case when a.resultado = 'Defuncion' then 1 else 0 end) * 100.0 / count(*) as porcentaje_fallecidos
from pacientes p join admisiones a on p.id_admision = a.id_admision
group by p.genero;









# ¿cual es el porcentaje de altas que terminan teniendo un reingreso dentro de los 30 días siguientes al alta? | pro | ctes | joins
		select
			id_paciente,
			id_admision,
			fecha_alta,
			resultado
		from admisiones
		where resultado != 'Defuncion'),
    total_altas as (
		select count(*) as total_altas
		from altas),
    reingresos_en_30_dias as (
		select
			a1.id_paciente,
            a1.id_admision as alta_id_admision,
            a2.id_admision as reingreso_id_admsion,
            a1.fecha_alta,
            a2.fecha_admision
        from altas a1 join admisiones a2 on a1.id_paciente = a2.id_paciente
			and a2.fecha_admision > a1.fecha_alta
            and datediff(a2.fecha_admision, a1.fecha_alta) <= 30),
	total_reingresos_en_30_dias as (
		select count(alta_id_admision) as total_reingresos_en_30_dias
        from reingresos_en_30_dias)
select
	round((num.total_reingresos_en_30_dias * 100.0 / denom.total_altas),2) as porc_reingresos_30_dias
from total_reingresos_en_30_dias num, total_altas denom;