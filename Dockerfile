FROM jupyterhub/systemuser

# Update pip
RUN pip install --upgrade pip

# Install psychopg2
RUN apt-get update
RUN apt-get -y install libpq-dev
RUN pip install psycopg2

# Install nano
RUN apt-get -y install nano

# Install terminado
RUN pip install terminado

# Install scikit-learn
RUN pip install scikit-learn

# Install widgets
RUN pip install ipywidgets

# Install plotchecker
RUN pip install plotchecker

# Install nose
RUN pip install nose

# Install git
RUN apt-get -y --no-install-recommends install git

# Install nbgrader
RUN pip install git+https://github.com/thotypous/nbgrader.git@4817cb1de5a4ef347fe26a04f762a5a53f4480f7#egg=nbgrader

# Ensure log dir exists
RUN mkdir -m0755 -p /var/log/nbgrader/

# Create mount point for exchange dir
RUN mkdir -m0777 -p /srv/nbgrader/exchange/

# Install the nbgrader extensions
RUN jupyter nbextension install --sys-prefix --py nbgrader
RUN jupyter nbextension enable --sys-prefix --py nbgrader
RUN jupyter serverextension enable --sys-prefix --py nbgrader

# Set ipython to use inline matplotlib by default
ADD ipython_config.py /etc/ipython/ipython_config.py

ADD nbgrader_config.py /etc/jupyter/nbgrader_config.py
