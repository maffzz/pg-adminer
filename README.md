# Evidencias: Contenedor PostgreSQL + Adminer

Este paquete reproduce el **Ejercicio propuesto** del taller (PostgreSQL + Adminer) tomando como base la metodología del taller que usó MySQL.

## Estructura
```
.
├─ docker-compose.yml
├─ run_postgres_adminer.sh
└─ sql/
   └─ employees_pg.sql
```

## Pasos rápidos
1. **Guarda** estos archivos en tu VM (por ejemplo `/home/ubuntu/contenedores/pg-adminer/`).
2. Dale permisos al script:
   ```bash
   chmod +x run_postgres_adminer.sh
   ```
3. **Levanta todo**:
   ```bash
   ./run_postgres_adminer.sh
   ```
4. Abre **Adminer** en `http://<IP_de_tu_VM>:8080` y usa:
   - *System*: PostgreSQL
   - *Server*: `db` (o `127.0.0.1` si accedes desde la misma VM)
   - *Username*: `postgres`
   - *Password*: `utec`
   - *Database*: `bd_api_employees`

## Comandos de evidencia sugeridos
Copia y pega las salidas de estos comandos en tu informe (o sube capturas):
```bash
docker volume ls
docker network ls
docker ps
docker exec -i postgres_c psql -U postgres -d bd_api_employees -c "\dt"
docker exec -i postgres_c psql -U postgres -d bd_api_employees -c "SELECT * FROM employees;"
```

## Equivalencias con el taller de MySQL
- **MySQL** (`mysql:8.0`) → **PostgreSQL** (`postgres:16`).
- Cliente web **phpMyAdmin/Adminer** → mantenemos **Adminer** y seleccionamos *System: PostgreSQL*.
- Script SQL: se reemplaza `AUTO_INCREMENT` por `SERIAL`, y `USE bd_api_employees` por `\c bd_api_employees`.
