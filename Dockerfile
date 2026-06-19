# Visor 3D estático del apartamento (Three.js + GLB horneado) servido por nginx
FROM nginx:1.27-alpine

# Config del sitio
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/app.conf

# Contenido web: index.html + apartment_baked.glb (+ cualquier asset en web/)
COPY web/ /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/healthz || exit 1
