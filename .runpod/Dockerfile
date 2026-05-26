FROM python:3.11-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
WORKDIR /app
COPY requirements.txt .
COPY handler.py .
COPY .runpod /app/.runpod
RUN apt update && apt install build-essential -y --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN uv pip install --index-strategy unsafe-best-match --no-cache-dir -r requirements.txt --system
RUN chmod +x /app/.runpod/entrypoint.sh
ENV HF_HOME=/workspace/hf
ENV VOXCPM_MODEL=openbmb/VoxCPM1.5
ENV TOKENIZERS_PARALLELISM=false
ENV retry_badcase=false

#CMD ["python3", "-u", "handler.py"]
ENTRYPOINT ["/app/.runpod/entrypoint.sh"]
CMD ["uv", "run", "handler.py"]