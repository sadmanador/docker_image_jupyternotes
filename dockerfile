FROM python:3.11-alpine

# Install dependencies and numpy
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
    numpy \
    && apk del build-base linux-headers

# Create a working directory
WORKDIR /home/jovyan/work

# Expose port 8888 for Jupyter Notebook
EXPOSE 8888

# Set environment variables
ENV JUPYTER_TOKEN=Hydra8778
ENV PYTHONUNBUFFERED=1

# Start the notebook server
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
