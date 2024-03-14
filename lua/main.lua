Tasks = {}

function greet() 
    print("\nWelcome to the Lua Todo List!")
    print("To get started, please enter a command or `help`.\n")
end

function Tasks:delete(id)
    for i, v in ipairs(self) do
        if i == id then
            table.remove(self, i)
        end
    end
end

function Tasks:add(task) 
    local body = task
    table.insert(self, {body=body})
end

function Tasks:display()
    print("Todo List:")
    for i, v in ipairs(self) do
        print(string.format("%d.) %s", i, v.body))
    end
    print("\n")
end

greet()
Tasks:add("task one")
Tasks:add("task two")
Tasks:add("task three")
Tasks:display()
Tasks:delete(2)
Tasks:display()