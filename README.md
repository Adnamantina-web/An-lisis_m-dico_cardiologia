




<img width="985" height="549" alt="admisiones" src="https://github.com/user-attachments/assets/b94514f5-22ac-4fb1-9d2d-59a0b23e99fb" />

<img width="897" height="507" alt="reingresos" src="https://github.com/user-attachments/assets/cf65273b-9787-460a-943a-928999d86831" />

# Análisis Médico en Cardiología  
**Proyecto de análisis de datos clínicos orientado a la identificación de insights generales y factores asociados a reingresos hospitalarios.**

---

##  Descripción del proyecto
Este proyecto fue desarrollado **durante mi proceso de formación como analista de datos**, por lo que combina ejercicios guiados, prácticas supervisadas y aportaciones propias. Aunque parte del contenido no es completamente original, el objetivo principal ha sido **aprender, aplicar y consolidar técnicas reales de análisis de datos** en un contexto clínico.

El análisis se centra en:

- Obtener **insights generales** sobre la población estudiada.  
- Identificar **patrones y factores de riesgo** asociados a los **reingresos hospitalarios**.  
- Construir un flujo de análisis reproducible mediante SQL, Python y herramientas de BI.

---

##  Estructura del repositorio

### 📁 1. SQL
- **01_Analisis_Insights_General_Soluciones.sql**  
  Consultas para el análisis general de la base de datos.

- **02_Analisis_Insights_Reingresos_Soluciones.sql**  
  Consultas centradas en el estudio de reingresos hospitalarios.

- **BD_Cardiologia_Dump.sql**  
  Dump de la base de datos utilizada.

---

### 📁 2. Documentación
- **Briefing del proyecto.pdf**  
  Documento con los objetivos, alcance y requisitos del análisis.

---

### 📁 3. Notebooks
- **Produccion.ipynb**  
  Notebook con el análisis exploratorio, preparación de datos y visualizaciones.

---

### 📁 4. Power BI
- **Desarollo.pbix**  
  Dashboard interactivo con los principales indicadores y visualizaciones.

---

## Metodología
1. **Carga y exploración de datos**  
2. **Limpieza y preparación**  
3. **Análisis exploratorio (EDA)**  
4. **Identificación de patrones y factores de riesgo**  
5. **Visualización y comunicación de resultados**

---
## 📊 Informe Ejecutivo – Resultados del Análisis

El análisis realizado sobre los datos del Servicio de Cardiología muestra una actividad asistencial estable, pero con un nivel de reingresos clínicamente relevante que impacta directamente en la carga operativa y en los costes del hospital. A continuación se resumen los hallazgos más importantes.

---

### 🫀 1. Actividad Asistencial – Admisiones

- Se registraron **701 admisiones** en el periodo analizado.
- La tendencia mensual es estable, con picos entre **septiembre y diciembre**.
- El **miércoles (19.5%)** es el día con mayor volumen de admisiones.
- La mayoría de pacientes ingresan desde **Urgencias**, con un flujo claro hacia **Alta**.
- Se registraron **46 fallecimientos**, lo que supone una mortalidad del **7.3%**.
- Los diagnósticos más frecuentes incluyen:
  - **Insuficiencia cardíaca (12.8%)**
  - **ICFER / ICFEN (≈12%)**
  - **IRA (11.7%)**
  - **IAMCEST / SCA (≈11%)**

Estas patologías están asociadas a mayor complejidad clínica y riesgo de reingreso.

---

### 🔁 2. Reingresos Hospitalarios

- **143 admisiones** corresponden a reingresos.
- **129 pacientes** reingresaron al menos una vez.
- La tasa de reingresos es del **20.4%**.
- El **4.04%** de las altas generan un reingreso en los primeros **30 días**.
- Los reingresos suponen **1.135 días de hospitalización**, con un coste estimado de **794.500 €**.
- Extrapolado al año completo, los reingresos representan:
  - **22.651 días de hospitalización**
  - **15,86 millones de euros** en costes

#🤝 Contribuciones
Este proyecto tiene un propósito formativo, pero cualquier sugerencia o mejora es bienvenida a través de issues o pull requests.

---

##  Cómo reproducir el análisis

### 1. Importar la base de datos
```sql
mysql -u usuario -p < BD_Cardiologia_Dump.sql
