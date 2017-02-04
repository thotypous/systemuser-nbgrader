FROM jupyter/systemuser

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

# Install nbgrader
RUN pip install nbgrader --pre

# Create nbgrader profile and add nbgrader config
ADD nbgrader_config.py /etc/jupyter/nbgrader_config.py

# Install the nbgrader extensions
RUN jupyter nbextension install --sys-prefix --py nbgrader
RUN jupyter nbextension enable --sys-prefix --py nbgrader
RUN jupyter serverextension enable --sys-prefix --py nbgrader

