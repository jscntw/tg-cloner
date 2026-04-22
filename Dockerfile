FROM python:3.11-slim

WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 复制项目文件
COPY . .

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir uvicorn

# 暴露 FastAPI 端口
EXPOSE 48000

# 启动命令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "48000"]
