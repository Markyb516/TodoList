//
//  TodoItemView.swift
//  Todo List
//
//  Created by Markus Buchanan on 5/31/25.
//

import SwiftUI

struct TodoItemView: View {
    var todoItem : TodoItem
    @State var editView = false
    var body: some View {
        Text("\(todoItem.description)")
            .sheet(isPresented: $editView, content: {
                EditItemView(item: todoItem, display: $editView)
            })
        
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        editView = true
                    }
                }
            }
            .navigationTitle("To Do Item")
    }
}

#Preview {
    NavigationStack{
        TodoItemView(todoItem: TodoItem(description: "test", complete: false))
    }
}
