FROM node:20-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci && npm cache clean --force

COPY . .
RUN npm run build        # this step would have create binary --> /app/dist

# --------- final stage ---------------

FROM nginx:1.27-alpine AS production

RUN rm -rf /etc/nginx/conf.d/default.conf /usr/share/nginx/html/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

USER nginx
EXPOSE 8080
CMD [ "nginx", "-g", "daemon off;" ]
    

# Config file = the map of the house (tells Nginx where to go)
# HTML files = the furniture in the house (what visitors see)

# Root → landlord → can rearrange furniture, give keys to others
# nginx → tenant → can use the furniture but cannot change the ownership of the house
# Giving USER nginx after RUN chown ... → ✅ works, correct
# Giving USER nginx before RUN chown ... → ❌ fails, because nginx cannot change root-owned files