# 杆杆响海报生成器

这是一个基于Vue3 + Flask的海报生成Web应用程序，用于批量生成杆杆响品牌的台球房宣传海报。

## 功能特性

- ✅ 单张海报生成（支持竖版和横版模板）
- ✅ 批量海报生成（通过Excel文件）
- ✅ 拖拽式文件上传
- ✅ 实时预览功能
- ✅ 二维码和Logo自定义替换
- ✅ 中文文本渲染支持
- ✅ 渐变发光文字效果
- ✅ 圆形二维码处理
- ✅ 响应式UI界面

## 技术栈

### 前端
- Vue 3 (Composition API)
- Element Plus UI组件库
- Vite构建工具
- Axios HTTP客户端

### 后端
- Flask Web框架
- Pillow图像处理库
- OpenPyXL Excel处理
- Numpy数组计算

## 项目结构

```
├── backend/                 # 后端服务
│   ├── app.py              # 主应用文件
│   ├── simple_app.py       # 简化版应用（推荐使用）
│   ├── services/           # 业务逻辑层
│   │   └── image_processor.py  # 图像处理服务
│   ├── routes/             # API路由
│   │   └── generate.py     # 生成相关接口
│   ├── templates/          # 海报模板
│   ├── uploads/            # 上传文件存储
│   ├── results/            # 生成结果存储
│   └── requirements.txt    # Python依赖
│
├── frontend/               # 前端应用
│   ├── src/                # 源代码
│   │   ├── views/          # 页面组件
│   │   │   └── GeneratorView.vue  # 主生成页面
│   │   ├── components/     # 可复用组件
│   │   ├── assets/         # 静态资源
│   │   └── main.js         # 入口文件
│   ├── index.html          # HTML模板
│   ├── vite.config.js      # Vite配置
│   └── package.json        # Node.js依赖
│
└── README.md               # 项目说明文档
```

## 快速开始

### 后端启动

```bash
# 进入后端目录
cd backend

# 安装Python依赖
pip install -r requirements.txt

# 启动服务（端口5002）
python simple_app.py
```

### 前端启动

```bash
# 进入前端目录
cd frontend

# 安装Node.js依赖
npm install

# 启动开发服务器（端口3004）
npm run dev
```

## 使用说明

### 单张海报生成

1. 访问 `http://localhost:3004`
2. 选择模板类型（竖版/横版）
3. 输入赛区名称和球房名称
4. 上传Logo图片（PNG/JPG格式）
5. 上传二维码图片（PNG/JPG格式）
6. 点击"生成海报"按钮
7. 预览并下载生成的海报

### 批量海报生成

1. 准备包含以下列的Excel文件：
   - 赛区名称
   - 球房名称
2. 在批量生成页面上传Excel文件
3. 配置生成参数
4. 开始批量生成
5. 下载打包结果

## API接口

### 文件上传
```
POST /api/upload
Content-Type: multipart/form-data
```

### 海报生成
```
POST /api/generate
Content-Type: application/json

{
  "template_type": "vertical",  // or "horizontal"
  "materials": {
    "logo": "logo_filename.png",
    "qrcode": "qrcode_filename.png",
    "saiqu_name": "赛区名称",
    "ballroom_name": "球房名称"
  }
}
```

### 下载结果
```
GET /api/download/{filename}
```

## 配置说明

### 端口配置
- 前端：3004端口
- 后端：5002端口
- 可在对应配置文件中修改

### CORS配置
前端已配置代理，可直接访问后端API

### 字体配置
系统会自动检测并使用Windows系统中文字体：
- 微软雅黑 (msyh.ttc)
- 宋体 (simsun.ttc)
- 黑体 (simhei.ttf)

## 开发指南

### 添加新模板
1. 在 `backend/templates/` 目录下添加新模板图片
2. 在 `image_processor.py` 中添加对应的处理方法
3. 更新前端模板选择选项

### 扩展功能
1. 修改 `services/image_processor.py` 添加新的图像处理逻辑
2. 在 `routes/generate.py` 中添加新的API接口
3. 更新前端组件以支持新功能

## 注意事项

1. 确保后端服务在前端之前启动
2. 图片文件建议使用PNG格式以保持透明度
3. 二维码建议使用正方形图片
4. 生产环境部署时请修改调试模式和安全配置

## 故障排除

### 常见问题

1. **端口占用**
   ```bash
   # 查看端口占用
   netstat -ano | findstr :3004
   
   # 强制终止进程
   taskkill /PID [进程ID] /F
   ```

2. **依赖安装失败**
   ```bash
   # 更新pip
   python -m pip install --upgrade pip
   
   # 逐个安装依赖
   pip install Flask Flask-CORS Pillow numpy openpyxl xlrd pandas
   ```

3. **跨域问题**
   检查后端CORS配置是否包含前端域名

## 许可证

本项目仅供内部使用。

## 更新日志

### v1.0.0 (2026-03-20)
- 初始版本发布
- 支持单张和批量海报生成
- 实现基础UI界面
- 完成核心图像处理功能