use std::fmt;

fn main() {
    greet();
    let mut todo_list = TodoList::new();
    todo_list.add_task("one");
    todo_list.add_task("two");
    todo_list.add_task("three");
    todo_list.add_task("four");
    todo_list.display();
}

struct Task(String);
struct TodoList(Vec<Task>);

impl TodoList {
    fn new() -> TodoList {
        TodoList(Vec::new())
    }
    
    fn add_task(&mut self, task: &str) {
        let new_task = Task::create(task);
        self.0.push(new_task);
    }

    fn display(self) {
        println!("Todo List:");
        for i in 0..self.0.len() {
            println!("{}.) {}", i+1, self.0[i]);
        }
    }
}

impl fmt::Display for Task {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.0)
    }
}

impl Task {
    fn create(body: &str) -> Task {
        let text = String::from(body);
        return Task(text);
    }
}
    
fn greet() {
    println!("Welcome to the Rust Todo List!");
    println!("Enter a command or type `help`.");
}
