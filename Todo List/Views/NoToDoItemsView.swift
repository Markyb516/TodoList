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
        VStack(spacing: Constants.spacing){
           Details
           AddItemLink
           Spacer()
        }
        .frame(maxWidth: 400, maxHeight: .infinity)
        
    }
    
    
    //MARK: - View properties

    var Details : some View{
        VStack{
            Text(Constants.Details.header)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, Constants.Details.headerPadding)
            Text(Constants.Details.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(Constants.Details.bodyPadding)
        }
    }
    
    var AddItemLink : some View{
        NavigationLink(destination: {
            AddItemView()
        }, label: {
            Text(animate ? Constants.AddItemLink.linkLabel : "")
                .foregroundStyle(.white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(animate ?   Color(UIColor(named: "accentColor")!) : .clear)
                .clipShape(RoundedRectangle(cornerRadius: Constants.AddItemLink.cornerRadius))
                .padding(.horizontal, Constants.AddItemLink.butttonPadding)
               
               .onAppear(perform: {
                   withAnimation(.easeOut(duration: Constants.AddItemLink.animationDuration)) {
                            if !animate{
                              animate.toggle()
                          }
                   }
                })
        })
    }
    //MARK: - Constants
    
    struct Constants{
        static let spacing = 5.0
        struct Details{
            static let header = "There are no items!"
            static let body = "Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!"
            static let headerPadding = 35.0
            static let bodyPadding = 40.0
        }
        struct AddItemLink{
            static let linkLabel = "Add Something 🥳"
            static let cornerRadius = 10.0
            static let animationDuration = 2.0
            static let butttonPadding = 10.0
        }
    }
    

}

#Preview {
    NavigationStack{
        NoToDoItemsView()
            .navigationTitle("title")
    }
}
