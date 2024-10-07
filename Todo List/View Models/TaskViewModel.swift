//
//  TaskViewModel.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import Foundation
typealias TodoItem = TaskModel.TodoItem

class TaskViewModel : ObservableObject{
    
    @Published private var model = TaskModel(){
        didSet{
            saveData()
        }
    }
    
    init() {
        getItems()
    }
    
    var taskItems : [TodoItem] {
        model.task
    }

    func getItems()  {
        if let data =  UserDefaults.standard.data(forKey: Constants.itemsKey), let decodedData = try? JSONDecoder().decode([TodoItem].self, from: data){
                model.task.append(contentsOf: decodedData)
        }
    }
    func remove(atOffsets: IndexSet){
        model.task.remove(atOffsets: atOffsets)
    }
    
    func move(fromOffsets: IndexSet, toOffset: Int){
        model.task.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    func addTask(_ description : String){
        model.task.append(TodoItem(description: description, complete: false))
    }
    
    func completeToggle(task: TodoItem){
        model.completeToggle(item: task)
        
    }
    
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(model.task){
            UserDefaults.standard.set(encodedData, forKey: Constants.itemsKey)
        }
    }
    
    
    struct Constants{
        static let itemsKey = "item_list"
    }
    
}
