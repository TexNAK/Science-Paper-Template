#!/bin/bash
sudo apt update
sudo apt install -qy --no-install-recommends --fix-missing \
        texlive texlive-latex-extra texlive-science texlive-lang-german \
        texlive-formats-extra \
        pandoc pandoc-citeproc \
        python3-pygments texlive-xetex texlive-bibtex-extra make \
    	python3-pip python3-setuptools python3-dev gcc wget lmodern fonts-lmodern fswatch unzip && \
sudo apt -yq autoremove
sudo apt clean -y
sudo pip3 install wheel pandoc-tablenos
PANDOC_VERSION=2.6
sudo wget https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb
sudo dpkg -i pandoc-*-amd64.deb
sudo rm pandoc-*-amd64.deb
sudo wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.3.0/linux-ghc84-pandoc23.tar.gz -q -O - | tar xz
sudo mv pandoc-crossref /usr/bin/
sudo rm pandoc-crossref.1