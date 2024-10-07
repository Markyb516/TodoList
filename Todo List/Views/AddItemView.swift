//
//  AddView.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dissmiss
    @State var textFieldText : String = ""
    @EnvironmentObject var taskVM : TaskViewModel
    @State var showAlert = false
    
    var colorLiteral = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    
    func savedButtonPressed(){
        if textIsApporoved(text: textFieldText){
            taskVM.addTask(textFieldText)
            print("Item added : \(textFieldText)")
            dissmiss.callAsFunction()
        }
        else{
            showAlert.toggle()
            print("item is invalid")
        }
    }
    
    func textIsApporoved(text : String) -> Bool {
        text.count < 1 ? false : true
    }
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding()
                    .background(Color(colorLiteral))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action:savedButtonPressed, label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .padding()
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                })
                
                
            }
            .padding(.horizontal,8)

        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Item is invalid"))
        }
    }
}

#Preview {
    NavigationStack{
        AddItemView()
    }
}
