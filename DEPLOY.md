# Despliegue — Visor 3D del apartamento (Dokploy)

App estática (Three.js + GLB horneado) servida por nginx en un contenedor.

## Archivos
- `web/` — raíz servida: `index.html` (visor) + `apartment_baked.glb` (modelo horneado).
- `Dockerfile` — nginx:alpine + copia de `web/`.
- `nginx.conf` — MIME de `.glb`, gzip, caché, `/healthz`.
- `docker-compose.yml` — servicio `web` (puerto interno 80).

## Dokploy
1. Sube este repo/carpeta a tu Git (o usa el deploy por carpeta de Dokploy).
2. En Dokploy: **Create → Compose**, apunta a `docker-compose.yml`.
3. En **Domains**, agrega tu dominio → servicio `web`, puerto **80**. Dokploy emite TLS.
4. **Deploy**. Listo: comparte el enlace (funciona en celular y PC, sin instalar nada).

## Prueba local (sin Dokploy)
```bash
docker compose build
docker run --rm -p 8090:80 entresoles-viewer:latest
# abrir http://localhost:8090
```

## Nota
`web/index.html` y `web/apartment_baked.glb` los genera la Fase B (horneado en Blender).
Hasta entonces, `web/index.html` es el visor en tiempo real como respaldo.
