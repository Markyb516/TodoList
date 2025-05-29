//
//  AddView.swift
//  Todo List
//
//  Created by Markus Buchanan on 10/5/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dissmiss
    @State var textFieldText : String = ""
    @EnvironmentObject var taskVM : TaskViewModel
    
  
    
    @State var showAlert = false
    let colorLiteral = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    
    func savedButtonPressed(){
        if textIsApporoved(text: textFieldText){
            taskVM.addTask(textFieldText)
            dissmiss.callAsFunction()
        }
        else{
            showAlert.toggle()
        }
    }
    
    func textIsApporoved(text : String) -> Bool {
        text.count < 1 ? false : true
    }
    
    var body: some View {
        ScrollView{
                UserInput
                .padding(.vertical)
                SaveButton
                Spacer()
            
        }
        .padding(.horizontal,Constants.spacing)
        .frame(maxWidth: 525)
        .navigationTitle(Constants.pageTitle)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(Constants.alertText))
        }
    }
    
    
//MARK: - View properties
    
    var UserInput : some View{
        
        TextField( "",text: $textFieldText , prompt: Text( Constants.UserInput.placeholder).foregroundStyle(.black), axis: .vertical)
        
            .foregroundStyle(.black)
            .padding()
            .background(Color(colorLiteral))
            .clipShape(RoundedRectangle(cornerRadius: Constants.UserInput.radius))
        
    }
    
    var SaveButton : some View{
        Button(action:savedButtonPressed, label: {
            Text(Constants.SaveButton.label)
                .foregroundStyle(.white)
                .padding()
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(colorScheme == .dark ? .accent : Color.blue )
                .clipShape(RoundedRectangle(cornerRadius: Constants.SaveButton.radius))

        })
    }
    
    //MARK: - Constants
    struct Constants{
        static let alertText = "Item is invalid"
        static let pageTitle = "Add an Item 🖊️"
        static let spacing = 8.0
        struct SaveButton{
            static let label = "Save"
            static let radius = 10.0
        }
        struct UserInput {
            static let placeholder = "Type something here..."
            static let radius = 10.0
        }
    }
}

#Preview {
    NavigationStack{
        AddItemView()
    }
}
