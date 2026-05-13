




<img width="985" height="549" alt="admisiones" src="https://github.com/user-attachments/assets/b94514f5-22ac-4fb1-9d2d-59a0b23e99fb" />

<img width="897" height="507" alt="reingresos" src="https://github.com/user-attachments/assets/cf65273b-9787-460a-943a-928999d86831" />

# 🫀 Análisis Médico en Cardiología  
Proyecto de análisis clínico orientado a comprender patrones de admisión, reingresos y riesgo en pacientes del área de cardiología.

---

## 📌 Descripción general del proyecto  
Este proyecto fue desarrollado durante mi proceso de formación como analista de datos. Combina ejercicios guiados con aportaciones propias, con el objetivo de aplicar técnicas reales de análisis clínico y visualización de datos en un entorno hospitalario.

El trabajo se centra en tres pilares:

- **Comprender el comportamiento de las admisiones hospitalarias.**  
- **Analizar los reingresos y su impacto asistencial y económico.**  
- **Desarrollar un enfoque predictivo mediante un modelo de *Risk Scoring*.**

El resultado es un análisis reproducible basado en SQL, Python y Power BI, acompañado de un informe ejecutivo orientado a la toma de decisiones.

---

## 📂 Estructura del repositorio

### 📁 1. SQL  
- **01_Analisis_Insights_General_Soluciones.sql** – Análisis general de la base de datos.  
- **02_Analisis_Insights_Reingresos_Soluciones.sql** – Consultas centradas en reingresos.  
- **BD_Cardiologia_Dump.sql** – Dump de la base de datos utilizada.

### 📁 2. Documentación  
- **Briefing del proyecto.pdf** – Objetivos, alcance y requisitos del análisis.

### 📁 3. Notebooks  
- **Produccion.ipynb** – Limpieza, EDA y preparación de datos.

### 📁 4. Power BI  
- **Desarollo.pbix** – Dashboard interactivo con los principales indicadores.

---

## 🧠 Metodología  
1. **Carga y exploración de datos**  
2. **Limpieza y preparación**  
3. **Análisis exploratorio (EDA)**  
4. **Estudio de reingresos y estancias**  
5. **Desarrollo del modelo de Risk Scoring**  
6. **Visualización y comunicación de resultados**

---

# 📊 Informe Ejecutivo – Resultados del Análisis

El análisis del Servicio de Cardiología muestra una actividad asistencial estable, pero con un nivel de reingresos clínicamente relevante que impacta en la carga operativa y en los costes del hospital. A continuación se resumen los hallazgos clave.

---

## 🫀 1. Actividad Asistencial – Admisiones  
- **701 admisiones** en el periodo analizado.  
- Tendencia mensual estable con picos entre **septiembre y diciembre**.  
- El **miércoles (19.5%)** es el día con mayor volumen de admisiones.  
- La mayoría de pacientes ingresan desde **Urgencias**.  
- **46 fallecimientos** → mortalidad del **7.3%**.  
- Diagnósticos más frecuentes:
  - Insuficiencia cardíaca (12.8%)  
  - ICFER / ICFEN (≈12%)  
  - IRA (11.7%)  
  - IAMCEST / SCA (≈11%)

Estas patologías están asociadas a mayor complejidad clínica y riesgo de reingreso.

---

## 🔁 2. Reingresos Hospitalarios  
- **143 admisiones** corresponden a reingresos.  
- **129 pacientes** reingresaron al menos una vez.  
- Tasa de reingresos: **20.4%**.  
- Reingresos <30 días: **4.04%**.  
- Impacto operativo:
  - **1.135 días de hospitalización** atribuibles a reingresos.  
  - Coste estimado: **794.500 €**.  
- Extrapolación anual:
  - **22.651 días de hospitalización**  
  - **15,86 millones de euros** en costes operativos.

---

## 👥 3. Perfil del Paciente de Mayor Riesgo  
- Edad media: **64.9 años**.  
- Mayoría: **hombres (≈68%)**.  
- Diagnósticos predominantes: IC, SCA, IRA.  
- Los pacientes que reingresan presentan **estancias más prolongadas**, aumentando la presión asistencial.

---

## 🧮 4. Risk Scoring – Modelo Predictivo  
El dashboard incorpora un modelo de **scoring de riesgo de reingreso**, con un valor medio de **2.95/10**.

### Distribución del riesgo  
- Niveles 1–3 concentran la mayoría de pacientes.  
- A partir del nivel 5, el riesgo aumenta de forma significativa.  

### Utilidad para la gestión  
El scoring permite:  
- Identificar pacientes vulnerables.  
- Priorizar intervenciones preventivas.  
- Optimizar recursos asistenciales.  
- Reducir reingresos evitables.  

Este modelo supone un paso hacia una gestión **predictiva**, no solo descriptiva.

---

## 🧭5. Recomendaciones Estratégicas  
1. **Fortalecer el seguimiento post‑alta**  
2. **Optimizar protocolos para pacientes geriátricos**  
3. **Reducir estancias hospitalarias innecesarias**  
4. **Minimizar reingresos en <30 días**  
5. **Mejorar la gestión de recursos hospitalarios**  
6. **Implementar el modelo de Risk Scoring**

---

## 🚀 Cómo reproducir el análisis

### 1. Importar la base de datos  
```bash
mysql -u usuario -p < BD_Cardiologia_Dump.sql

### 2. Ejecutar las consultas SQL
01_Analisis_Insights_General_Soluciones.sql

02_Analisis_Insights_Reingresos_Soluciones.sql

### 3. Ejecutar el notebook
Abrir Produccion.ipynb en Jupyter o VS Code.

### 4. Visualizar el dashboard
Abrir Desarollo.pbix en Power BI Desktop.

🤝 Contribuciones
Proyecto con fines formativos. Sugerencias y mejoras son bienvenidas mediante issues o pull requests.
