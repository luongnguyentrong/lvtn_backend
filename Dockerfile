FROM apache/superset
USER root
WORKDIR /app
ENV SUPERSET_SECRET_KEY=0NjDl036arerLFCMVtL3asykJVhUI0TuePSirkruJA4Fw73EuDSaIBfn
RUN pip install psycopg2
USER superset
RUN superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password UamqhxiNA/HfwT1mR33bk1nZ92+XFEnmLvckpfp3DbuKaoyPXYVREJgC
RUN superset db upgrade
RUN superset init
EXPOSE 8088

