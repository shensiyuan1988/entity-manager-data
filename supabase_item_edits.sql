-- 创建事项编辑数据表
CREATE TABLE IF NOT EXISTS item_edits (
    id SERIAL PRIMARY KEY,
    item_code TEXT NOT NULL UNIQUE,
    edit_data JSONB NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 创建索引
CREATE INDEX IF NOT EXISTS idx_item_edits_code ON item_edits(item_code);
CREATE INDEX IF NOT EXISTS idx_item_edits_updated ON item_edits(updated_at);

-- 添加注释
COMMENT ON TABLE item_edits IS '事项编辑数据表，存储用户在页面对事项的编辑';
COMMENT ON COLUMN item_edits.item_code IS '事项编码，唯一标识';
COMMENT ON COLUMN item_edits.edit_data IS '编辑数据，JSON格式存储所有修改的字段';
COMMENT ON COLUMN item_edits.updated_at IS '最后更新时间';
COMMENT ON COLUMN item_edits.created_at IS '创建时间';
