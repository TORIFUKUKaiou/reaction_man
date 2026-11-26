# syntax=docker/dockerfile:1

# 依存は uv.lock のとおりに入れる。取得元は Takumi Guard のレジストリ。
FROM python:3.14-slim AS builder

ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never \
    UV_DEFAULT_INDEX=https://pypi.flatt.tech/simple/ \
    PIP_INDEX_URL=https://pypi.flatt.tech/simple/

RUN pip install --no-cache-dir uv==0.13.9

WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --locked --no-dev --no-install-project


FROM python:3.14-slim

ENV PYTHONUNBUFFERED=1 \
    PATH="/app/.venv/bin:$PATH"

RUN groupadd --system --gid 10001 app && useradd --system --uid 10001 --gid app --no-create-home app

WORKDIR /app
COPY --from=builder /app/.venv /app/.venv
COPY app.py ./

USER app

CMD ["python", "app.py"]
