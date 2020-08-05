FROM phusion/baseimage:0.11

# Set correct environment
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Install texlive and pandoc requisites as well as fswatch
RUN apt-get -yq update && \
    apt-get install -qy --no-install-recommends --fix-missing \
        texlive texlive-latex-extra texlive-science texlive-lang-german \
        texlive-generic-extra \
        python3-pygments texlive-xetex texlive-bibtex-extra make \
    	python3-pip python3-setuptools python3-dev gcc wget lmodern fonts-lmodern fswatch unzip && \
    apt-get -yq autoremove && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install upstream pandoc
ENV PANDOC_VERSION 2.6
RUN wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb && \
    dpkg -i pandoc-*-amd64.deb
RUN wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.3.0/linux-ghc84-pandoc23.tar.gz -q -O - | tar xz && \
    mv pandoc-crossref /usr/bin/

# Install pandoc filters
RUN pip3 install wheel && pip3 install pandoc-tablenos

RUN mkdir -p /project
WORKDIR /project

ENTRYPOINT ["./build.sh"]
CMD ["build"]
