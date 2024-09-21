# 使用官方 Node.js 运行时作为父镜像
FROM node:16-slim

# 安装 git
RUN apt-get update && apt-get install -y git

# 设置工作目录
WORKDIR /app

# 从 GitHub 克隆仓库
RUN git clone https://github.com/gyxzhao/notdiamond2api.git .

# 安装依赖
RUN npm install node-fetch@2 stream/web

# 设置环境变量
#ENV AUTH_EMAIL=${AUTH_EMAIL}
#ENV AUTH_PASSWORD=${AUTH_PASSWORD}
#ENV AUTH_ENABLED=${AUTH_ENABLED}
#ENV AUTH_VALUE=${AUTH_VALUE}
#ENV PORT=7860

# 暴露端口
EXPOSE 7860

# 运行应用
CMD ["node", "workers.js"]
