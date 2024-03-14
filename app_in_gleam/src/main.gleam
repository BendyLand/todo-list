import gleam/io
import gleam/list
import gleam/int
import gleam/string

pub fn main() {
    greet()
    let todo_list = create_todo_list()
    let todo_list = add_task(todo_list, "task one")
    let todo_list = add_task(todo_list, "task two")
    display(todo_list)
}

pub type Task { Task(body: String) }

pub type TodoList { TodoList(tasks: List(Task)) }

pub fn display(todo_list: TodoList) {
    io.println("Todo List:")
    todo_list.tasks
    |> list.index_map(fn(task, i) {
        io.println(string.concat([int.to_string(i+1), ".) ", task.body]))
    })
}

pub fn add_task(tasks: TodoList, task: String) -> TodoList {
    let new_task = Task(task)
    let new_tasks = [new_task, ..tasks.tasks]
    TodoList(new_tasks)
}

pub fn create_todo_list() -> TodoList {
    TodoList([])
}

pub fn create_task(task: String) -> Task {
    Task(task)
}

pub fn greet() {
    io.println("Welcome to the Gleam Todo List!")
    io.println("Please enter a command or type `help`:")
}