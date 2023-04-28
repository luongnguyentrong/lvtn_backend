FROM apache/superset
USER root
WORKDIR /app
ENV SUPERSET_SECRET_KEY=0NjDl036arerLFCMVtL3asykJVhUI0TuePSirkruJA4Fw73EuDSaIBfn
RUN pip install psycopg2
RUN pip install sqlalchemy
RUN pip install flask_openid 
RUN pip install itsdangerous==2.0.1
RUN pip install flask_oidc==1.3.0

COPY ./config/superset ./pythonpath

USER superset
RUN superset re-encrypt-secrets
RUN superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password UamqhxiNA/HfwT1mR33bk1nZ92+XFEnmLvckpfp3DbuKaoyPXYVREJgC
RUN superset db upgrade
RUN superset init
EXPOSE 8088

