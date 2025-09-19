#!/usr/bin/env bash
set -euo pipefail

echo "🧱 Creando estructura de carpetas..."
mkdir -p sql

echo "📄 Verificando docker-compose.yml y sql/employees_pg.sql"
test -f docker-compose.yml && echo "docker-compose.yml OK" || echo "FALTA docker-compose.yml"
test -f sql/employees_pg.sql && echo "sql/employees_pg.sql OK" || echo "FALTA sql/employees_pg.sql"

echo "🐘 Levantando Postgres + Adminer"
docker compose up -d

echo "⏳ Esperando 8s a que Postgres inicie..."
sleep 8

echo "🔎 Listando contenedores:"
docker ps

echo "🔐 Probando conexión psql dentro del contenedor..."
docker exec -i postgres_c psql -U postgres -c "\l"
docker exec -i postgres_c psql -U postgres -d bd_api_employees -c "\dt"
docker exec -i postgres_c psql -U postgres -d bd_api_employees -c "SELECT * FROM employees;"

cat <<EOF

✅ Accede a Adminer en: http://<IP_de_tu_VM>:8080
   System: PostgreSQL
   Server: db (o 127.0.0.1 si estás en la misma VM)
   Username: postgres
   Password: utec
   Database: bd_api_employees

Para detener:
  docker compose down

Para eliminar datos (¡destruye la BD!):
  docker volume rm $(docker volume ls -q | grep pg_data) || true
EOF
