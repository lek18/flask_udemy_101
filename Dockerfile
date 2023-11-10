FROM python:3.11
WORKDIR /app
# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1\
    PYTHONUNBUFFERED=1\
    POETRY_VERSION=1.4.1

# install poetry - respects $POETRY_VERSION & $POETRY_HOME

RUN pip install --upgrade pip\
    pip install poetry==${POETRY_VERSION}
RUN poetry config virtualenvs.create false

COPY . .
RUN poetry install --no-root
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5001"]
