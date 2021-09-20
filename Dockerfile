FROM tensorflow/tensorflow
RUN apt-get update

COPY . .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# RUN ["mkdir", "notebooks"]
COPY conf/.jupyter /root/.jupyter
COPY run_jupyter.sh /

# Jupyter and Tensorboard ports
EXPOSE 8888

# Store notebooks in this mounted directory
VOLUME /notebooks

CMD ["/run_jupyter.sh"]