import std/strformat
import std/sequtils
import std/sugar

proc greet() = 
    echo "\nWelcome to the Nim Todo List!"
    echo "To get started, please type a command or `help`.\n"

var 
    current_id = 0
    tasks: seq[tuple[id: int, body: string]]

proc delete_task(id: int) = 
    let new_tasks = tasks.filter(x => x.id != id-1)
    tasks = new_tasks

proc add_task(task: string) = 
    tasks.add((current_id, task))
    current_id += 1

proc display_todo_list() = 
    echo "Todo List:\n"
    for i, elem in tasks:
        echo &"{i+1}.) {elem.body}"
    echo "\n"

when isMainModule:
    greet()
    add_task("task one")
    add_task("task two")
    add_task("task three")
    display_todo_list()
    delete_task(2)
    display_todo_list()
