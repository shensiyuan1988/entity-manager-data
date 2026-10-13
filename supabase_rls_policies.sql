-- 为 item_edits 表添加 RLS 策略，允许匿名访问
-- 注意：这会允许任何人读写该表，仅适用于公共数据

-- 启用 RLS（如果未启用）
ALTER TABLE item_edits ENABLE ROW LEVEL SECURITY;

-- 允许匿名SELECT
CREATE POLICY "Allow anonymous select" ON item_edits
    FOR SELECT
    TO anon
    USING (true);

-- 允许匿名INSERT
CREATE POLICY "Allow anonymous insert" ON item_edits
    FOR INSERT
    TO anon
    WITH CHECK (true);

-- 允许匿名UPDATE
CREATE POLICY "Allow anonymous update" ON item_edits
    FOR UPDATE
    TO anon
    USING (true)
    WITH CHECK (true);

-- 允许匿名DELETE
CREATE POLICY "Allow anonymous delete" ON item_edits
    FOR DELETE
    TO anon
    USING (true);
