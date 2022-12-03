//
//  ListViewModel.swift
//  TodDoList
//
//  Created by TrungTin on 12/1/22.
//

import Foundation
import UIKit

class ListViewModel:ObservableObject{
    @Published var  items :[ItemModel]=[]{
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_key"
    init(){
        getItem()
    }
    // get new Items
    func getItem(){
       guard
        let data = UserDefaults.standard.data(forKey: itemsKey),
        let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data  )
    else {return}
        self.items=saveItems
        
    }
    // Delete Item
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets:  indexSet)
    }
    // Move Item to new position
    func moveItem(from :IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String ){
        let newItem = ItemModel(title:title,isCompleted: false)
        items.append(newItem)
        
    }
    func uppdateItem(item : ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index]=item.updateCompletion()
        }
//        if let index = items.firstIndex { (existingItem)->Bool in
//            return existingItem.id == item.id
//
//        }{
//            items[index]=item.updateCompletion()
//        }
//
    }
    func saveItems(){
        if let enocdeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(enocdeData, forKey: itemsKey)
        }
    }
}
