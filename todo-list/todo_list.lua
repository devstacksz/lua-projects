local DbManager = require("db_manager")
local dbManager = DbManager:new()
dbManager:createTable()

local function add_todo(name)
	dbManager:addEntry(name)
end

local function remove_todo(id)
	dbManager:deleteEntry(id)
end

local function print_actions()
	print("-----")
	local result = dbManager:getEntries()
	for _, v in ipairs(result) do
		print(v.id .. " " .. v.title .. ": " .. v.done)
	end
	print("-----")
end

local function execute_action(action)
	local selected_action = nil

	if action ~= nil then
		selected_action = action
	elseif arg[2] ~= nil then
		selected_action = arg[2]
	else
		print("Action not provided")
	end

	if selected_action == "add" then
		local name = io.read()
		if name ~= nil then
			add_todo(name)
			print_actions()
		else
			print("Error: name not provided")
		end
	elseif selected_action == "update" then
		local name = io.read()
		if name ~= nil then
			update_todo(name, 1)
			print_actions()
		else
			print("Error: name not found")
		end
	elseif selected_action == "remove" then
		local name = io.read()
		if name ~= nil then
			remove_todo(name)
			print_actions()
		else
			print("Error: name not found")
		end
	elseif selected_action == "print" then
		print_actions()
	else
		print("Invalid action")
	end
end

if arg[1] == nil then
	while true do
		print("Select one of the following options:")
		print()
		print("* add")
		print("* remove")
		print("* print")
		print()
		local action = io.read()
		execute_action(action)
	end
end
