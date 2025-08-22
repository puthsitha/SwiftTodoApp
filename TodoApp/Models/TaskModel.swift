//
//  TaskModel.swift
//  TodoApp
//
//  Created by Puthsitha Moeurn on 20/8/25.
//

import Foundation

struct TaskModel: Identifiable, Codable{
    let id:String
    let title:String
    let isComplete:Bool
    
    init(id: String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateTask() -> TaskModel{
        return TaskModel(id: self.id, title: self.title, isComplete: !self.isComplete)
    }
}
