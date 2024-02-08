FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/django-ve/django-helloworld.git  /app
RUN pip3 install -r /app/requirements.txt

WORKDIR /app

RUN python3 manage.py migrate

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
