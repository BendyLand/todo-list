import std/strformat
import std/sequtils
import std/sugar

proc greet() = 
    echo "\nWelcome to the Nim Todo List!"
    echo "To get started, please type a command or `help`.\n"

var 
    tasks: seq[string]

proc delete_task(id: int) = 
    var new_list: seq[string]
    for i, elem in tasks:
        if i != id-1:
            new_list.add(elem)
    tasks = new_list

proc add_task(task: string) = 
    tasks.add(task)

proc display_todo_list() = 
    echo "Todo List:\n"
    for i, elem in tasks:
        echo &"{i+1}.) {elem}"
    echo "\n"

when isMainModule:
    greet()
    add_task("task one")
    add_task("task two")
    add_task("task three")
    display_todo_list()
    delete_task(2)
    display_todo_list()
