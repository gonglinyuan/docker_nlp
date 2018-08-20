FROM phillyregistry.azurecr.io/philly/jobs/toolkit/tensorflow:community-gpu-1.9.0-cp35
MAINTAINER gonglinyuan

ENTRYPOINT ["/bin/bash", "-c"]

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/envs/deep_learning/bin:/opt/conda/bin:$PATH

ADD https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh /tmp/
RUN /bin/bash /tmp/Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda
RUN rm /tmp/Miniconda3-latest-Linux-x86_64.sh

RUN /opt/conda/bin/conda update -y --all
RUN /opt/conda/bin/conda create -y --name deep_learning python numpy tqdm gensim nltk -c anaconda
RUN /opt/conda/bin/conda update  -y -n deep_learning --all
RUN /opt/conda/bin/conda install -y -n deep_learning visdom -c conda-forge
RUN /opt/conda/bin/conda install -y -n deep_learning pytorch torchvision -c pytorch

CMD [ "source activate deep_learning && /bin/bash" ]