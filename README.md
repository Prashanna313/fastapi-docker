# FastAPI-DOCKER
* To setup this repo in local system, clone the repo and run `local_setup.sh` script
* Activate the python virtual environment `source venv/bin/python`

## Building docker images
* set VERSION as env var, for linux based
    * `export VERSION=2`
* Run the docker build command<br>
    * `docker build -t fastapi_sample:${VERSION} .`

## Accessing it locally
* Once we've built the image, we can reference it in `backend` service defined in `docker-compose.yaml`
* To start backend service, use
    * `docker-compose up -d backend`