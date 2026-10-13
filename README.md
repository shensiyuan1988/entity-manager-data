# 事项数据管理系统

政务服务事项数据的可视化管理系统，支持事项浏览、筛选、编辑和数据持久化。

## 功能特性

- 📋 **事项浏览**：支持深圳市全量14,381个政务服务事项的浏览和搜索
- 🔍 **多维筛选**：按区域、事项类型快速筛选
- 📝 **在线编辑**：支持基本信息、受理条件、政策依据等字段编辑
- 💾 **云端持久化**：数据自动保存到 Supabase，换设备、清缓存不丢失
- 📥 **数据导出**：支持导出变更数据为 JSON 格式

## 技术栈

- **前端**：纯 HTML/CSS/JavaScript，无框架依赖
- **数据**：JSON 静态数据 + Supabase 云端存储
- **部署**：GitHub Pages 自动部署

## 部署方式

### GitHub Pages

推送到 master 分支后，GitHub Actions 会自动部署到 GitHub Pages。

访问地址：`https://<username>.github.io/entity-manager-data/`

### Supabase 配置

1. 在 Supabase 中创建项目
2. 执行 `supabase_item_edits.sql` 创建编辑数据表
3. 修改 `index.html` 中的 `SUPA_URL` 和 `SUPA_KEY` 为你的 Supabase 项目配置

## 数据结构

### items_data.json

包含所有事项的基础数据，字段包括：
- `c`: 事项编码
- `n`: 事项名称
- `d`: 主管部门
- `s`: 服务对象
- `sc`: 受理条件（场景化）
- `regs`: 关联法规
- `materials`: 材料清单
- `results`: 办事结果
- 其他基本信息字段

### regulations_lib.json

法规库数据，包含法规详情和条款内容。

### Supabase 表结构

#### item_edits 表

存储用户编辑的事项数据：

| 字段 | 类型 | 说明 |
|------|------|------|
| id | SERIAL | 主键 |
| item_code | TEXT | 事项编码（唯一） |
| edit_data | JSONB | 编辑数据（JSON格式） |
| updated_at | TIMESTAMP | 最后更新时间 |
| created_at | TIMESTAMP | 创建时间 |

## 本地开发

1. 克隆仓库
2. 直接在浏览器中打开 `index.html`（需要 HTTP 服务器）
3. 或使用任意静态文件服务器：
   ```bash
   python3 -m http.server 8000
   ```

## 数据备份

- 定期使用"导出变更"功能备份编辑数据
- 所有编辑数据同时保存在 Supabase 云端
- 原始数据可从 `items_data.json` 恢复

## 维护说明

- 更新事项数据：修改 `items_data.json` 后推送
- 更新法规库：修改 `regulations_lib.json` 后推送
- 更新前端功能：修改 `index.html` 后推送

## License

Internal use only.
