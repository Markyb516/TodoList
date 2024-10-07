//
//  TaskList.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/6/24.
//

import SwiftUI

struct TaskList: View {
    @EnvironmentObject var taskVM : TaskViewModel
    
    var body: some View {
        ZStack{
            if taskVM.taskItems.isEmpty{
            NoToDoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: Constants.animationDuration)))
            }
            else{
                List{
                    ForEach(taskVM.taskItems){ taskItem in
                        ListRowView(task: taskItem).onTapGesture {
                            withAnimation{
                                taskVM.completeToggle(task: taskItem)
                            }
                        }
                    }
                    .onDelete(perform: taskVM.remove)
                    .onMove(perform:taskVM.move)
                    
                }
                
            }
        }
    }
    struct Constants{
        static let animationDuration = 0.5
    }
}

#Preview {
    TaskList()
}
