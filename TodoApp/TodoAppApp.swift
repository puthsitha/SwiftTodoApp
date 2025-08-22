//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Puthsitha Moeurn on 20/8/25.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var taskViewModel:TaskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                TaskListView()
            }
            .environmentObject(taskViewModel)
        }
    }
}
