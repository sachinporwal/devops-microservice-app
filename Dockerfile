FROM python:3.11-slim

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt pytest

COPY app app
COPY app/tests tests

EXPOSE 5000

CMD ["python", "-m", "app.main"]
