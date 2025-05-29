//
//  TaskViewModel.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import Foundation

class TaskViewModel : ObservableObject{
    @Published private var model = TaskModel()
    
    init() {
        loadData()
    }

    var taskItems : [TodoItem] {
        model.task
    }
    
  
    private func loadData() {
           if let data = UserDefaults.standard.data(forKey: Constants.itemsKey),
              let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) {
               model.task = decoded
           }
       }
    
       
    func remove(atOffsets: IndexSet){
        model.task.remove(atOffsets: atOffsets)
        saveData()
    }
    
    func move(fromOffsets: IndexSet, toOffset: Int){
        model.task.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func addTask(_ description : String){
        model.task.append(TodoItem(description: description, complete: false))
        saveData()

    }
    
    func completeToggle(task: TodoItem){
        model.completeToggle(item: task)
        saveData()
        
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
