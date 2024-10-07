//
//  NoToDoItemsView.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/6/24.
//

import SwiftUI

struct NoToDoItemsView: View {
    @State var animate = false
    var body: some View {
        VStack(spacing:5){
            Text("There are no items!")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 35)
            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(40)
            NavigationLink(destination: {
                AddItemView()
            }, label: {
                Text(animate ? "Add Something 🥳" : "")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(animate ? .red : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 10)
                   
                   .onAppear(perform: {
                       withAnimation(.easeOut(duration: 2.0)) {
                                if !animate{
                                  animate.toggle()
                              }
                       }
                    })
            })
            
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    NavigationStack{
        NoToDoItemsView()
            .navigationTitle("title")
    }
}
