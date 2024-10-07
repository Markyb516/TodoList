//
//  ContentView.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var taskVM : TaskViewModel
    @State private var isEditMode: EditMode = .inactive
    
    var body: some View {
        
        TaskList()
            .navigationTitle(Constants.navigationTitle)
            .toolbar{
                if !taskVM.taskItems.isEmpty{
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink{
                            AddItemView()
                        }label:{Text(Constants.addToolbarTitle) }
                    }
                }
            }.onChange(of: taskVM.taskItems) { _, _ in
                if taskVM.taskItems.isEmpty{
                    isEditMode = .inactive
                }
            }
            .environment(\.editMode, $isEditMode)
    }
 
    struct Constants{
       static let navigationTitle = "Todo List 📝"
       static let addToolbarTitle = "Add"
    }
}

#Preview {
    
    NavigationStack{
        TodoListView()
    }.environmentObject(TaskViewModel())
}
