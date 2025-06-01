//
//  EditItemView.swift
//  Todo List
//
//  Created by Markus Buchanan on 6/1/25.
//

import SwiftUI

struct EditItemView: View {
    @EnvironmentObject var taskVM : TaskViewModel
    let item: TodoItem
    @State  var fieldText = ""
    @Binding var display : Bool

    var body: some View {
        
        Form {
           
            Section("Edit To Do Item") {
                TextField("Enter item description", text: $fieldText, axis: .vertical)
            
            }
            HStack{
                Spacer()
                Text("submit")
                    .foregroundStyle(.green)
                    .onTapGesture {
                        if !fieldText.isEmpty {
                            taskVM.editItem(id: item.id, description: fieldText)
                            display = false
                        }
                    }
                Spacer()
            }
            
            
            .navigationTitle("To do item : \(item.description)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    @Previewable @State var test  = true
    NavigationStack{
        EditItemView(item:TodoItem(description: "test", complete: false) , display: $test)
    }
}
