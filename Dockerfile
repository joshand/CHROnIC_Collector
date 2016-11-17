FROM debian:latest
MAINTAINER Josh Anderson <joshand@cisco.com>

# You can provide comments in Dockerfiles
# Install any needed packages for your application
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    mercurial \
    python-lxml \
    wget \
 && rm -rf /var/lib/apt/lists/*

COPY ["app.py", "requirements.txt", "genid.sh", "/root/"]
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install -r /root/requirements.txt
RUN chmod +x /root/app.py
RUN chmod +x /root/genid.sh
RUN /root/genid.sh
CMD ["python", "-u", "/root/app.py"]
