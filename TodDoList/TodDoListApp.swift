//
//  TodDoListApp.swift
//  TodDoList
//
//  Created by TrungTin on 11/29/22.
//

import SwiftUI
/*
     MVVM Architecture
 Model - data point
 View - UI
 ViewModel

 */
@main
struct TodDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
