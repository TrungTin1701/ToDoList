//
//  ListRowView.swift
//  TodDoList
//
//  Created by TrungTin on 11/29/22.
//

import SwiftUI

struct ListRowViews: View {
    let thirdColor = Color("ThirdAccentColor")
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? thirdColor : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
      
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Marry Quynh", isCompleted: false)
    static var item2 = ItemModel(title: "10 Ngan Nam", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowViews(item: item1)
            ListRowViews(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
