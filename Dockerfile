FROM python:3.11-slim
RUN apt-get update && apt-get install -y \
    make \
    software-properties-common \
    curl \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip setuptools
RUN pip install coveralls bandit
WORKDIR /app
COPY . /app/
RUN pip install -e .
RUN pip install -e ".[dev]"
RUN pip install -e ".[tests]"
