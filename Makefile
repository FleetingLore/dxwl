# ---- 部署 ----
HOST   ?= root@160.202.47.107
DIR    ?= /var/www/dxwl

.PHONY: setup build serve deploy clean

# 一键安装依赖
setup:
	@echo "=== Python deps ==="
	pip install -r requirements.txt
	@echo "---"
	@echo "✓ All dependencies ready."

# 构建站点
build:
	mkdocs build

# 本地预览
serve:
	mkdocs serve

# 上传
deploy: build
	rsync -avz --delete site/ $(HOST):$(DIR)/

# 清理
clean:
	rm -rf site/
