-- Translated By Volt for Auriga use
-- 元の翻訳: zackdreaver (https://github.com/zackdreaver/ROenglishRE)
-- 継続開発: llchrisll (https://github.com/llchrisll/ROenglishRE)
-- このファイルは自由に配布、使用、変更できます
-- オリジナルコード: Neo-Mind
-- 詳細情報: https://llchrisll.github.io/ROTPDocs/guides/customs/#multi-iteminfo-support

-- 関数ファイルを読み込み
require("SystemEN/LuaFiles514/itemInfo_f")

-- 英語翻訳ファイルを読み込み
dofile("SystemEN/LuaFiles514/itemInfo.lua")

-- JRO専用データを読み込み（同じアイテムIDの場合は上書き）
dofile("SystemEN/LuaFiles514/jroitemInfo.lua")

-- カスタムアイテムやオーバーライドなどの追加ファイルを読み込み
-- 新しいテーブルは一意の名前が必要です。インポートするには、
-- 最後に "itemInfoMerge" 行をコピーして適宜調整してください。

-- すべてのファイルを "SystemEN" フォルダに配置すると、自動的に追加されます
ImportFiles = {
	"itemInfo_C.lua", -- カスタムアイテム
}
-- テーブルの接尾辞のみを定義します。'tbl_' は自動的に追加されます
-- 注意: "tbl_override" は最後に個別に処理されます
ImportTables = {
	"custom",
}

---------------- 翻訳ファイルの追加設定 ----------------
-- 翻訳ファイルのServerパラメータに基づいて元のサーバーを表示
-- 0 = 無効 / 1 = アイテム名内 / 2 = 説明の上部 / 3 = 説明の下部
DisplayServer = 1

-- アイテム名にアイテムIDを表示する方法を定義（他の設定では無効）
TagStart = '('
TagEnd = ')'

-- サーバー名を表示する色を定義（公式アイテムに影響）
-- 形式: '^<RRGGBB>'
-- '' = "Server: " と同じ色 (^0000CC = 青)
-- '^FFFFFF' = 白
ServerColour = '^FF0000'

-- 説明の下部にアイテムIDを表示（カスタムアイテムにも影響）
-- 0 = 無効 / 1 = 説明の上部 / 2 = 説明の下部
DisplayItemID = 2

-- 説明の下部にデータベースリンクを表示 (true/false)
DisplayDatabase = true

---------------- カスタムアイテムの追加設定 ----------------
-- サーバー名を表示
-- 0 = 無効 / 1 = アイテム名内 / 2 = 説明の上部 / 3 = 説明の下部
DisplayCustomServer = 0

-- アイテム名にアイテムIDを表示する方法を定義（他の設定では無効）
CustomTagStart = '['
CustomTagEnd = ']'

-- カスタムアイテムのサーバー名
CServerName = 'Auriga'

-- カスタムサーバー名を表示する色を定義（カスタムアイテム）
-- 形式: '^<RRGGBB>'
-- '' = "Server: " と同じ色 (^0000CC = 青)
-- '^FFFFFF' = 白
CServerColour = '^00FF00'

-- カスタムアイテムのデータベースリンク（例: fluxcp） (true/false)
DisplayCustomDB = false

----- データベースリンクテーブル -------------------
ItemDatabase = {
	["Divine-Pride"] = {
		Name = "Divine-Pride.net",
		URL = "https://www.divine-pride.net/database/item/"
	},
	["iRO"] = {
		Name = "iRO Wiki",
		URL = "https://db.irowiki.org/db/item-info/"
	},
	["Custom"] = {
		Name = "Database",
		URL = "http://127.0.0.1/?module=item&action=view&id="
	}
}

---------------- 以下の行は、何をしているか理解していない限り変更しないでください ----------------
require('SystemEN/LuaFiles514/rotp_f')

-- "ImportFiles" テーブル内の各ファイルをループして読み込む
for _, v in ipairs(ImportFiles) do
	dofile('SystemEN/'..v)
end

-- "ImportTables" テーブル内の各テーブルをループし、
-- メインテーブル "tbl" にマージする
for _, v in ipairs(ImportTables) do
	F_itemInfoMerge(_G['tbl_'..v], false)
end

F_itemInfoMerge(tbl_override, true) -- 公式オーバーライド
F_itemInfoMerge(tbl_jro, true) -- JROオーバーライド（最優先）
---------------------------------------------------
