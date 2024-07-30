# .gitpod.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Instala o GitHub CLI
RUN apt-get update && apt-get install -y gh
