local sqlite3 = require("lsqlite3complete")
local FILENAME = "db.sqlite3"
--[[
local function showrow(udata, cols, values, names)
	assert(udata == "test_udata")
	for i = 1, cols do
		print("", names[i], values[i])
	end
	return 0
end
]]
--

DbManager = {}
DbManager.__index = DbManager

function DbManager:new()
	local newObj = { db = nil }
	return setmetatable(newObj, self)
end

function DbManager:createTable()
	self.db = sqlite3.open(FILENAME)
	local sql = string.format([=[
		CREATE TABLE IF NOT EXISTS todos
			(
			id INTEGER PRIMARY KEY,
			title TEXT NOT NULL,
			done INTEGER NOT NULL DEFAULT 0
			);
	]=])
	local result = self.db:exec(sql)
	self.db:close()

	return result
end

function DbManager:clearTable() end

function DbManager:dropTable(tableName)
	self.db = sqlite3.open(FILENAME)
	local sql = string.format(
		[=[
	DROP TABLE %s;
	]=],
		tableName
	)
	local result = self.db:exec(sql)
	self.db:close()
	return result
end

function DbManager:addEntry(title)
	self.db = sqlite3.open(FILENAME)
	local sql = string.format(
		[=[
			INSERT INTO todos (title) VALUES ('%s');
		]=],
		title
	)
	local result = self.db:exec(sql)
	self.db:close()
	return result
end

function DbManager:getEntries()
	self.db = sqlite3.open(FILENAME)
	local rows = {}
	for a in self.db:nrows("SELECT * FROM todos") do
		table.insert(rows, a)
	end
	self.db:close()
	return rows
end

function DbManager:deleteEntry(id)
	self.db = sqlite3.open(FILENAME)
	local sql = string.format(
		[=[
		DELETE FROM todos WHERE id = %s;
	]=],
		id
	)
	local result = self.db:exec(sql)
	self.db:close()
	return result
end

return DbManager
