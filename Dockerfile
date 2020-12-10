FROM mcr.microsoft.com/vscode/devcontainers/anaconda:dev-3

# Copy environment.yml (if found) to a temp locaition so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
RUN conda config --set channel_priority strict
COPY environment.yml* noop.txt /tmp/conda-tmp/
RUN conda env update --help
RUN conda create -n py36 python=3.6 algo_trading

RUN conda install -c quantopian zipline -n algo_trading
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
