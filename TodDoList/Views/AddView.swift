//
//  AddView.swift
//  TodDoList
//
//  Created by TrungTin on 11/29/22.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    @State var IsSave : Bool = false
    @State var alerTitle : String = ""
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color(UIColor.secondarySystemBackground).opacity(0.7))
                .cornerRadius(10)
                Spacer()
                Button (action:{
                    saveButtonPress()
                   
                } ,
                       label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
                    .alert(isPresented: self.$IsSave, content: getAlert)
            }
            .padding()
        }
        .navigationTitle("Add an Item 🖋")
    }
    func saveButtonPress(){
        if(textIsAppropriate()){
            listViewModel.addItem(title: textFieldText)
            print("Quynh")
            self.IsSave = true
            print( "Heheh")
            print(textFieldText)
            textFieldText.removeAll()
        }
    }
    func textIsAppropriate()->Bool{
        if textFieldText.count < 3 {
            alerTitle = "Your new todo item must be at least 3 characters long !!! 😱 😢😢 😱"
            IsSave.toggle()
            return false
            
        }
        alerTitle="You will add this \(textFieldText) in your todo List"
        return true
        
    }
    func getAlert  ()->Alert{
        return Alert(title: Text(alerTitle),
                     
                     dismissButton: .default(Text("Got it!"))
        )
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
    }
}

