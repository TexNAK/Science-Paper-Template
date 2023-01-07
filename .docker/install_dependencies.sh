#!/bin/bash
apt update
apt install -qy --no-install-recommends --fix-missing \
        xz-utils \
        texlive texlive-latex-extra texlive-science texlive-lang-german \
        texlive-formats-extra \
        pandoc pandoc-citeproc \
        python3-pygments texlive-xetex texlive-bibtex-extra make \
    	python3-pip python3-setuptools python3-dev gcc wget lmodern fonts-lmodern fswatch unzip && \
apt -yq autoremove
apt clean -y

pip3 install wheel pandoc-tablenos

PANDOC_VERSION=2.19.2
wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb
dpkg -i pandoc-*-amd64.deb
rm pandoc-*-amd64.deb

CROSSREF_VERSION=0.3.14.0
wget https://github.com/lierdakil/pandoc-crossref/releases/download/v${CROSSREF_VERSION}/pandoc-crossref-Linux.tar.xz -q -O - | tar -xJf - -C /usr/bin pandoc-crossref
