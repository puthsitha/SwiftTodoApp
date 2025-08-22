//
//  TaskItem.swift
//  TodoApp
//
//  Created by Puthsitha Moeurn on 20/8/25.
//

import SwiftUI

struct TaskItem: View {
    let task: TaskModel
    
    var body: some View {
        HStack{
            Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                .foregroundStyle(task.isComplete ? .green : .red)
            Text(task.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 2)
    }
}

#Preview {
    let task1 = TaskModel(title: "First item!", isComplete: false)
    let task2 = TaskModel(title: "Second Item.", isComplete: true)
    
    Group{
        TaskItem(task: task1)
        TaskItem(task: task2)
    }
}
