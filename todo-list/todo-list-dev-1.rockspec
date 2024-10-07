package = "todo-list"
version = "dev-1"
source = {
	url = "git+https://github.com/devstacksz/lua-projects.git",
}
description = {
	homepage = "https://github.com/devstacksz/lua-projects",
	license = "*** please specify a license ***",
}
build = {
	type = "builtin",
	modules = {
		todo_list = "todo_list.lua",
	},
}

dependencies = {
	"lua >= 5.4",
	"lsqlite3complete >= 0.9.6",
}
