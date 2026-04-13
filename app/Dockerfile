FROM python:3.11-alpine

WORKDIR /app

# Create non-root user
RUN adduser -D appuser

# Copy app
COPY app.py .

# Install Flask without cache
RUN pip install --no-cache-dir flask

# Switch to non-root user
USER appuser

EXPOSE 3000

CMD ["python", "app.py"]