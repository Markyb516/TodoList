//
//  Task.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import Foundation
typealias TodoItem = TaskModel.TodoItem

struct TaskModel {
    var task : [TodoItem] = []

    mutating func completeToggle(item:TodoItem){
        if let foundIndex = task.firstIndex(of: item){
            task[foundIndex].complete.toggle()
        }
    }
    
    
    
    struct TodoItem : Identifiable , Equatable , Codable{
        var description : String
        var complete : Bool
        private(set) var id = UUID().uuidString
    }
}
