//
//  AddTodoViewController.swift
//  TodoApp
//
//

import UIKit

class AddTodoViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    @IBOutlet weak var todoTitleField: UITextField!
    @IBOutlet weak var todoNotes: UITextField!
    @IBOutlet weak var todoDueDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTodoPressed(_ sender: UIButton) {
        if todoTitleField.text == "" || todoNotes.text == ""{
            dismiss(animated: true, completion: nil)
        }else{
            let todo = Todo(context: context)
            todo.title = todoTitleField.text!
            todo.note = todoNotes.text!
            todo.due_date = todoDueDate.date
            
            saveContext()
            dismiss(animated: true, completion: nil)
        }
    }
}
