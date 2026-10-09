FROM python:3.7
WORKDIR /app
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libpq-dev \
    && rm -rf /var/lib/apt/lists/*
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
RUN useradd --create-home appuser \
    && chown -R appuser:appuser /app
USER appuser
EXPOSE 4000
CMD ["python", "main.py"]
