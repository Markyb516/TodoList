//
//  TaskList.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/6/24.
//

import SwiftUI

struct TaskList: View {
    @State private var isEditing: EditMode = .inactive

    @EnvironmentObject private var taskVM : TaskViewModel
    var body: some View {
        ZStack{
            if taskVM.taskItems.isEmpty {
                    
                    NoToDoItemsView()
                        .background(.quinary)
                    
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: Constants.animationDuration)))
                        .toolbar(.hidden, for: .automatic)
                        .onAppear {
                            isEditing = .inactive
                        }
                
                
            }
            else{
                ListData
                    .toolbar {
                        ToolbarItem(
                         placement: .topBarLeading) {
                             EditButton()
                         }
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink{
                                AddItemView()
                            }label:{Text("Add")}
                        }
                    }

            }
        }
      
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ , maxHeight: .infinity)
        .background(.quinary)
        .environment(\.editMode, $isEditing)


        
        

    }
    
    //MARK: - View properties
    
    var ListData : some View {
        List{
            ForEach(taskVM.taskItems){ taskItem in
                ListRowView(task: taskItem).onTapGesture {
                    withAnimation{
                        taskVM.completeToggle(task: taskItem)
                    }
                }
            }
            .onDelete(perform: taskVM.removeItem)
            .onMove(perform:taskVM.moveItem)
          
           
            
        }
    }
    
    //MARK: - Constants

    struct Constants{
        static let animationDuration = 0.5
        static let addToolbarTitle = "Add"
    }
}

#Preview {
  
    NavigationStack{
        TaskList()
            .environmentObject(TaskViewModel())
    }
}

