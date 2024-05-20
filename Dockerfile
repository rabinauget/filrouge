FROM python:3.6-alpine
WORKDIR /opt
RUN pip install --no-cache-dir flask
EXPOSE 8000
ENV ODOO_URL=""
ENV PGADMIN_URL=""
ENTRYPOINT [ "python3", "app.py" ]