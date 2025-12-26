# python-service

一个简单的 FastAPI 示例服务，包含健康检查和 echo 接口。

## 快速开始（本地）
```bash
pip install -r requirements.txt
uvicorn app:app --reload --host 0.0.0.0 --port 8000
```
访问：
- 健康检查：`GET http://localhost:8000/health`
- Echo：`POST http://localhost:8000/echo`，请求体例如 `{"message": "hello"}`

## 使用 Docker 运行
Dockerfile 支持通过构建参数指定基础镜像（解决拉取超时问题）：
```bash
# 默认使用 Dockerfile 内的镜像源
docker compose up --build

# 指定可访问的基础镜像
docker compose build --build-arg PY_BASE=docker.m.daocloud.io/library/python:3.11-slim
docker compose up -d
```
如需全局镜像加速，可在 Docker 守护进程配置 `registry-mirrors`（重启 Docker 后生效）。

测试