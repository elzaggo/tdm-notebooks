FROM tdmproject/tdm-tools:latest
MAINTAINER simone.leo@crs4.it

RUN useradd -m jupyter && \
    pip install --no-cache-dir \
        wget \
        ckanapi \
        jupyter \
        matplotlib \
        cartopy \
        easydev \
        colormap


WORKDIR /home/jupyter
USER jupyter
RUN mkdir .jupyter
COPY --chown=jupyter jupyter_notebook_config.py .jupyter/
COPY --chown=jupyter check check_notebook.py ./
COPY --chown=jupyter notebooks notebooks

WORKDIR notebooks

EXPOSE 8888
ENTRYPOINT ["/bin/bash", "-c", "jupyter notebook"]
