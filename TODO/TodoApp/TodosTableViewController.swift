//
//  TodosTableViewController.swift
//  TodoApp
//
//  Created by Mohammad Al-haddad on 07/12/2021.
//

import UIKit
import CoreData

class TodosTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    
    var todos : [Todo] = []
    
    override func viewDidAppear(_ animated: Bool) {
        fetchTodos()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        
        let todo = todos[indexPath.row]
        cell.todoTitle.text = todo.title!
        cell.todoNotes.text = todo.note!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: todo.due_date!)
        cell.todoDueDate.text = dateString
        
        if todo.completed {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        todo.completed = !todo.completed
        if todo.completed {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        saveContext()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        context.delete(todo)
        saveContext()
        todos.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func fetchTodos(){
        let request:NSFetchRequest<Todo> = Todo.fetchRequest()
        do{
            todos = try context.fetch(request)
        }catch{
            print(error)
        }
    }
    

}
