-- table of todos
local todos = {}

local function add_todo(name)
	local todo_to_add = { name = name, status = 0 }
	table.insert(todos, todo_to_add)
end

local function find_todo(name)
	for i, v in ipairs(todos) do
		if v.name == name then
			return i
		end
	end
	print("Not found")
	return nil
end

local function update_todo(name, status)
	local index = find_todo(name)
	if index ~= nil then
		todos[index].status = status
	end
end

local function remove_todo(name)
	local index = find_todo(name)
	if index ~= nil then
		table.remove(todos, index)
	end
end

local function print_actions()
	print("-----")
	for _, v in ipairs(todos) do
		print(v.name .. ": " .. v.status)
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
		print("* update")
		print("* remove")
		print("* print")
		print()
		local action = io.read()
		execute_action(action)
	end
end
