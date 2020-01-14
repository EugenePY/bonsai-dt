FROM jupyter/datascience-notebook as ds_notebook

USER root
 
RUN conda config --set ssl_verify false
RUN conda install xgboost
RUN conda install -c conda-forge shap
ARG BONSAI_HOME=/bonsai

# installing bonsai
WORKDIR ${BONSAI_HOME}

EXPOSE 8888

CMD ["jupyter", "notebook", "--allow-root", "--port=8888", "--no-browser"]