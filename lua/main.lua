Tasks = {}

function greet() 
    print("\nWelcome to the Lua Todo List!")
end

function Tasks:get_input()
    print("\nPlease enter a command or `help`.")
    local input = io.read("*l")
    if input == "add" then
        Tasks:add()
        Tasks:get_input()
    elseif input == "delete" then
        Tasks:delete()
        Tasks:get_input()
    elseif input == "display" then
        Tasks:display()
        Tasks:get_input()
    elseif input == "help" then
        Tasks:get_help()
        Tasks:get_input()
    elseif input == "exit" then
        print("\nShutting down Todo List...")
        print("\nHere is your final list:")
        Tasks:display()
    else
        print("Invalid input.")
        Tasks:get_input()
    end
end

function Tasks:get_help()
    print("\nThe available commands are:")
    print("add\ndelete\ndisplay\nexit\nhelp")
end

function Tasks:delete()
    print("Which task would you like to delete?")
    Tasks:display()
    local id = io.read("*n")
    for i, v in ipairs(self) do
        if i == id then
            table.remove(self, i)
            print("Task removed successfully!")
            return 
        end
    end
end

function Tasks:add() 
    print("Enter your task: ")
    local task = io.read("*l")
    local body = task
    table.insert(self, {body=body})
end

function Tasks:display()
    print("Todo List:")
    for i, v in ipairs(self) do
        print(string.format("%d.) %s", i, v.body))
    end
end

greet()
Tasks:get_input()