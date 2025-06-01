//
//  ListRowView.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import SwiftUI

struct ListRowView: View {
    let task : TodoItem
    var body: some View {
        HStack{
            Image(systemName: task.complete ? Constants.completedImage: Constants.toDoImage)
                .foregroundStyle(task.complete ? .green : .red)
            NavigationLink(task.description){
                TodoItemView(todoItem: task)
            }
        }.font(.title2)
            .foregroundStyle(.primary)
    }
    //MARK: - Constants

    struct Constants{
       static let completedImage = "checkmark.circle.fill"
       static let toDoImage = "circle"
    }
}

#Preview {
    NavigationStack{
        VStack{
            
            ListRowView(task: TodoItem(description: "tester", complete: false))
            ListRowView(task: TodoItem(description: "tester", complete: true))
        }
    }
}
