# Basis-Image
FROM python:3.10-slim

# Arbeitsverzeichnis im Container
WORKDIR /app

# Requirements kopieren und installieren
COPY app/requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Restliche Dateien kopieren
COPY . .

# Umgebung setzen
ENV CONFIG_FILE=config/app.yaml

# Port 8082 freigeben
EXPOSE 8082

# App starten
CMD ["python3", "app/main.py"]
