FROM python:3.8-slim
LABEL Author="Prashanna" Description="Sample fastapi docker image"

WORKDIR /code
COPY setup.* /code/
COPY src/ /code/src/

RUN chmod 755 setup.sh &&\
    ./setup.sh

COPY src/fastapi_sample /code/app/
EXPOSE 80
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]