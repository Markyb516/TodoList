//
//  HomePageToolbar.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/6/24.
//

    import SwiftUI

    struct HomePageToolbar : ViewModifier{
       let todos : [TodoItem]
       let titleString : String
        
       func body(content: Content) -> some View {
           content
            .toolbar{
                    if !todos.isEmpty{
                        ToolbarItem(placement: .topBarLeading) {
                            EditButton()
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink{
                                AddItemView()
                            }label:{Text(titleString) }
                        }
                    }
                }
        }
    }

extension View {
    
    func homePageToolbar(task : [TodoItem], title: String) -> some View {
        modifier(HomePageToolbar(todos: task, titleString: title))
    }
}
