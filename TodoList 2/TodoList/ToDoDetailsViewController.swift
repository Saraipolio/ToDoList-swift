//
//  ToDoDetailsViewController.swift
//  TodoList
//
//  Created by Student on 2/17/23.
//

import UIKit

class ToDoDetailsViewController: UIViewController {
    var toDoCD : ToDoCD? = nil
    
    @IBOutlet weak var toDoLabel: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let toDo = toDoCD {
                if toDo.priority == 1 {
                    if let name = toDo.name{
                        toDoLabel.text = "❗️" + name
                    }
                }
                else if toDo.priority == 2 {
                    if let name = toDo.name{
                        toDoLabel.text = "‼️" + name
                    }
                }
                else {
                    if let name = toDo.name{
                        toDoLabel.text = name
                    }
                }
            }
        }
    @IBAction func doneTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = toDoCD {
                context.delete(toDo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
