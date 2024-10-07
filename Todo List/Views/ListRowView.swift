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
            Image(systemName: task.complete ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.complete ? .green : .red)
            NavigationLink(task.description){
                Text(task.description)
            }
        }.font(.title2)
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
