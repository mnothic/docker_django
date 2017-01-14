FROM python:3
MAINTAINER jorge@bsdchile.cl
ENV ENGINE "sqlite3"
ENV DATABASE ""
ENV DATABASE_NAME "twentyonegists_local"
ENV DATABASE_USERNAME ""
ENV DATABASE_PASSWORD ""
ENV REDIS_URL ""
ENV APP_DIR /opt/21buttons
RUN mkdir $APP_DIR
ADD requirements.txt $APP_DIR
ADD twentyonegists $APP_DIR
ADD run.sh /
WORKDIR $APP_DIR
RUN pip install -r requirements.txt
EXPOSE 8000
ENTRYPOINT [ "bash", "/run.sh" ]
