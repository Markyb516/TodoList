//
//  ContentView.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var taskVM : TaskViewModel

    
    var body: some View {
        
        TaskList()
            
            .navigationTitle(Constants.navigationTitle)
           
    }
 
    //MARK: - Constants

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
