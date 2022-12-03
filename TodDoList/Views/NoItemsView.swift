//
//  NoItemsView.swift
//  TodDoList
//
//  Created by TrungTin on 12/2/22.
//

import SwiftUI

struct NoItemsView: View {
    @State var  animate : Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView {
            VStack {
                Text("There is no Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("If you want to add more Items to you Todo List. You can click the button below .\n It you make your day!")
                    .padding(.vertical ,20)
               NavigationLink(
                destination: AddView(),
                label: {
                    Text("Add SomeThing 🥳 ")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame( height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
               )
                    .padding (.horizontal,animate ? 30 : 50)
                    .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animate  ? 30 : 10 ,
                            x: 0,
                            y: animate  ? 50  : 30	)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7  : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform:  {
                addAnimation()
            })
            
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        
    }
    
    // Create Func Animate Button
    func addAnimation (){
        guard   !animate  else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
           withAnimation(
            .easeOut(duration: 2.0)
                .repeatForever()
           ){
               animate.toggle()
           }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
