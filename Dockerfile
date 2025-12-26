# 允许通过构建参数指定基础镜像，默认使用开放的代理源（避免认证问题）
ARG PY_BASE=registry.dockerproxy.com/library/python:3.11-slim
FROM ${PY_BASE}

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

# 设置 Python 环境变量
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app

# 安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/

# 复制应用代码
COPY app.py .

# 暴露端口
EXPOSE 8000

# 运行应用，使用4个工作进程提高并发处理能力
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4"]