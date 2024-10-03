FROM python:3.11-alpine


RUN apk add --no-cache \
    bash \
    build-base \
    linux-headers \
    freetype-dev \
    libpng-dev \
    jpeg-dev \
    zeromq-dev \
    && pip install --no-cache-dir \
    notebook \
    jupyterlab \
    pandas \
    matplotlib \
    && apk del build-base linux-headers


WORKDIR /home/jovyan/work


EXPOSE 8888


ENV JUPYTER_TOKEN=Hydra8778
ENV PYTHONUNBUFFERED=1


CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]