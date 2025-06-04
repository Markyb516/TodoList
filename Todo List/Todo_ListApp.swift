//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import SwiftUI

@main
struct Todo_ListApp: App {
    @StateObject private var taskViewModel : TaskViewModel = TaskViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                TodoListView()
            }.environmentObject(taskViewModel)
        }
    }
}
