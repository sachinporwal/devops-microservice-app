FROM python:3.11-slim

WORKDIR /app

ENV PYTHONPATH=/app

COPY app /app/app

RUN pip install flask pytest

EXPOSE 5000

CMD ["python", "-m", "app.main"]
