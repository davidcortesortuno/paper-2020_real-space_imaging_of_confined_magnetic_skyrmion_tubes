FROM ubuntu:18.04

# -----------------------------------------------------------------------------
# LIBRARIES

# ENTRYPOINT ["/bin/bash"]  
# SHELL ["/bin/bash", "-c"] 

# Avoid user interaction dialog
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# We need cython3 from the ubuntu repos, since cython-ising Sundials fail
# with pip cython
RUN apt update -y
RUN apt install -y build-essential cmake python3-dev python3-pip cython3 \
    python3-pytest-cov liblapack-dev libopenblas-dev \
    wget make gfortran libblas-dev liblapack-dev python3-tk sudo fonts-lato

RUN ln -s /usr/bin/python3 /usr/bin/python

# Next line for codecov target
RUN apt install -y curl git

RUN pip3 install ipywidgets nbval numpy scipy matplotlib==2.2.2 notebook psutil pytest pytest-cov pillow h5py -U
# RUN pip3 install --upgrade setuptools==20.4

# Headless Matplotlib:
ENV MPLBACKEND=Agg

# OOMMFPY
WORKDIR /io
RUN git clone https://github.com/davidcortesortuno/oommfpy
WORKDIR /io/oommfpy
RUN git checkout tags/v0.1
RUN pip3 install .


# OOMMF BUILD -----------------------------------------------------------------
# RUN apt install -y git tk-dev tcl-dev wget
# 
# # Compile oommf 2.0a and create OOMMFTCL environment variable
# WORKDIR /usr/local
# RUN git clone https://github.com/fangohr/oommf
# WORKDIR /usr/local/oommf
# # Use specific 2.0a version
# RUN git checkout tags/2.0a0_20170929a0
# RUN make build-with-dmi-extension-all
# WORKDIR /usr/local
# RUN mv oommf oommf_TMP && mv oommf_TMP/oommf oommf && rm -rf oommf_TMP 
# ENV OOMMFTCL /usr/local/oommf/oommf.tcl
# 
# # Create executable oommf script
# WORKDIR /usr/local/bin
# RUN echo "#! /bin/bash" > oommf
# RUN echo "tclsh /usr/local/oommf/oommf.tcl \"\$@\"" >> oommf
# RUN chmod a+x oommf

# -----------------------------------------------------------------------------

# Set threads for OpenMP:
ENV OMP_NUM_THREADS=2
WORKDIR /io

# -----------------------------------------------------------------------------
# User to make Binder happy
ENV NB_USER micromag
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# Set the working directory
WORKDIR /home/${USER}/micromag

# -----------------------------------------------------------------------------
