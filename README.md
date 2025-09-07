# EPE2 – Reservas Hotel

Aplicación Java (Servlets + JSP + JPA/Hibernate) para gestionar **Usuarios**, **Hoteles**, **Habitaciones** y **Reservas**.  
Stack: Java 17, Tomcat 9+, MariaDB/MySQL 8, Maven, Bootstrap 5.

## Requisitos
- JDK 17
- Maven 3.8+
- Tomcat 9+
- MariaDB/MySQL (XAMPP ok)

## Base de datos
Dump incluido: `db/full_dump.sql`

**Restaurar (Windows/XAMPP):**
```bat
"C:\xampp\mysql\bin\mysql.exe" -u dbipchile -p -e "CREATE DATABASE IF NOT EXISTS reservas_hotel CHARACTER SET utf8mb4;"
"C:\xampp\mysql\bin\mysql.exe" -u dbipchile -p reservas_hotel < "db\full_dump.sql"
