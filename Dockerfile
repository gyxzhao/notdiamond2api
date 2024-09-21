# 使用官方 Node.js 运行时作为父镜像
FROM node:16-slim

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json (如果存在)
COPY package*.json ./

# 安装项目依赖
RUN npm install

# 复制项目文件到工作目录
COPY . .

# 设置环境变量
ENV AUTH_EMAIL=${AUTH_EMAIL}
ENV AUTH_PASSWORD=${AUTH_PASSWORD}
ENV AUTH_ENABLED=${AUTH_ENABLED}
ENV AUTH_VALUE=${AUTH_VALUE}
ENV PORT=7860

# 暴露端口
EXPOSE 7860

# 运行应用
CMD ["node", "workers.js"]