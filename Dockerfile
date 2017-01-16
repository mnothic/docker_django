FROM python:3
#FROM python:3-alpine

MAINTAINER jorge@bsdchile.cl

ENV ENGINE "sqlite3"
ENV DATABASE ""
ENV DATABASE_NAME "twentyonegists_local"
ENV DATABASE_USERNAME ""
ENV DATABASE_PASSWORD ""
ENV REDIS_URL ""
ENV APP_DIR /opt/21buttons/

WORKDIR $APP_DIR

COPY requirements.txt $APP_DIR

# Uncomment only when this issue gets fixed (https://github.com/gliderlabs/docker-alpine/issues/231)
# RUN set -ex && \
#    apk update && apk upgrade && apk --no-cache add --virtual .build-dependencies \
#    gcc  \
#    postgresql-dev \
#    python3-dev \
#    musl-dev && \
#    pip install -r requirements.txt && \
#    apk del .build-dependencies

RUN set -x && pip install -r requirements.txt

COPY twentyonegists $APP_DIR
#COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 8000

#ENTRYPOINT ["docker-entrypoint.sh"]
ENTRYPOINT ["gunicorn"]
CMD ["-b","0.0.0.0:8000", "twentyonegists.wsgi:application"]
