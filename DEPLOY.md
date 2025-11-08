# 算力券演示系统 - Cloudflare Pages 部署指南

## 项目说明

这是一个纯静态HTML演示系统，展示算力券活动的各个步骤页面。

## 部署到 Cloudflare Pages

### 方法一：通过 Cloudflare Dashboard（推荐）

#### 1. 准备工作

- 确保项目已推送到 Git 仓库（GitHub、GitLab 或 Bitbucket）
- 如果没有 Git 仓库，可以：
  - 在 GitHub 创建新仓库
  - 将项目文件上传并提交

#### 2. 部署步骤

1. **登录 Cloudflare Dashboard**
   - 访问 https://dash.cloudflare.com/
   - 登录你的账户

2. **创建 Pages 项目**
   - 点击左侧菜单的 "Workers & Pages"
   - 点击 "Create application"
   - 选择 "Pages" 标签
   - 点击 "Connect to Git"

3. **连接 Git 仓库**
   - 选择你的 Git 提供商（GitHub/GitLab/Bitbucket）
   - 授权 Cloudflare 访问你的仓库
   - 选择包含此项目的仓库
   - 点击 "Begin setup"

4. **配置构建设置**
   - **Project name**: 输入项目名称（如：compute-voucher-demo）
   - **Production branch**: 选择主分支（通常是 `main` 或 `master`）
   - **Build command**: 留空（纯静态项目不需要构建）
   - **Build output directory**: 留空或填写 `/`（根目录）
   - **Root directory**: 留空（如果项目在仓库根目录）

5. **部署**
   - 点击 "Save and Deploy"
   - 等待部署完成（通常1-2分钟）

6. **访问网站**
   - 部署完成后，Cloudflare 会提供一个 URL
   - 格式：`https://your-project-name.pages.dev`
   - 点击 URL 即可访问你的网站

### 方法二：通过 Wrangler CLI（命令行）

#### 1. 安装 Wrangler

```bash
npm install -g wrangler
```

#### 2. 登录 Cloudflare

```bash
wrangler login
```

#### 3. 创建 Pages 项目

```bash
wrangler pages project create compute-voucher-demo
```

#### 4. 部署项目

在项目根目录执行：

```bash
wrangler pages deploy . --project-name=compute-voucher-demo
```

### 方法三：直接上传文件夹（最简单）

1. **登录 Cloudflare Dashboard**
   - 访问 https://dash.cloudflare.com/
   - 进入 "Workers & Pages" > "Pages"

2. **创建项目**
   - 点击 "Create a project"
   - 选择 "Upload assets"
   - 输入项目名称

3. **上传文件**
   - 将整个项目文件夹拖拽到上传区域
   - 或选择文件夹上传

4. **部署**
   - 点击 "Deploy site"
   - 等待上传完成

## 自定义域名（可选）

1. **在 Cloudflare Dashboard 中**
   - 进入你的 Pages 项目
   - 点击 "Custom domains"
   - 点击 "Set up a custom domain"
   - 输入你的域名（如：demo.yourdomain.com）

2. **配置 DNS**
   - 在 Cloudflare DNS 设置中添加 CNAME 记录
   - 名称：demo（或你想要的子域名）
   - 目标：你的 Pages 项目 URL（如：compute-voucher-demo.pages.dev）

## 注意事项

1. **文件路径**
   - 确保所有相对路径正确
   - 图片路径：`../算力券原型部分截图/0算力券活动状态机图.png`
   - CSS 路径：`styles/main.css`

2. **图片资源**
   - 如果图片较大，建议优化后再上传
   - 确保图片路径在部署后仍然有效

3. **浏览器兼容性**
   - 项目使用了现代 CSS 特性（Grid、Flexbox）
   - 建议使用现代浏览器访问

4. **HTTPS**
   - Cloudflare Pages 自动提供 HTTPS
   - 无需额外配置

## 更新部署

### 通过 Git（自动部署）

- 每次推送到连接的 Git 仓库时，Cloudflare 会自动重新部署
- 在 Cloudflare Dashboard 中可以查看部署历史

### 手动更新

- 如果使用直接上传方式，需要重新上传整个文件夹

## 故障排查

1. **页面无法访问**
   - 检查部署状态是否为 "Success"
   - 查看部署日志中的错误信息

2. **资源加载失败**
   - 检查文件路径是否正确
   - 确保所有文件都已上传

3. **样式不生效**
   - 检查 CSS 文件路径
   - 清除浏览器缓存

## 项目结构

```
算力券演示/
├── index.html              # 主页面
├── pages/                  # 页面目录
│   ├── state-machine.html
│   ├── activity-create.html
│   ├── activity-list.html
│   ├── activity-detail.html
│   ├── order-select.html
│   ├── material-submit.html
│   ├── verification-manage.html
│   └── audit.html
├── styles/                 # 样式目录
│   └── main.css
├── assets/                 # 资源目录（图片等）
└── 算力券原型部分截图/     # 截图目录
```

## 联系支持

如有问题，可以：
- 查看 Cloudflare Pages 文档：https://developers.cloudflare.com/pages/
- 联系 Cloudflare 支持

