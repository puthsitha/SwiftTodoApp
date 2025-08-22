//
//  TaskViewModel.swift
//  TodoApp
//
//  Created by Puthsitha Moeurn on 20/8/25.
//

import Foundation

class TaskViewModel:ObservableObject{
    @Published var taskData: [TaskModel] = []{
        didSet{
            // every time the taskData has changed this method call
            // the purepose is the set the task in the local storage
            saveTaskLocalStorage()
        }
    }
    
    let key: String = "task"
        
    init() {
        // call first
        getTasks()
    }
    
    func getTasks() {
        guard
            let receiveData = UserDefaults.standard.data(forKey: key),
            let tasks = try? JSONDecoder().decode([TaskModel].self, from: receiveData)
        else {
            return
        }
        self.taskData = tasks
    }
    
    func createTask(title: String) {
        let newTask = TaskModel(title: title, isComplete: false)
        taskData.append(newTask)
    }
    
    func updateTask(task: TaskModel) {
        if let index = taskData.firstIndex(where: { $0.id == task.id}) {
            taskData[index] = task.updateTask()
        }
    }
    
    func moveTask(from: IndexSet, to: Int) {
        taskData.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteTask(indexSet: IndexSet) {
        taskData.remove(atOffsets: indexSet)
    }
    
    func saveTaskLocalStorage() {
        if let tasks = try? JSONEncoder().encode(taskData) {
            UserDefaults.standard.set(tasks, forKey: key)
        }
    }
}
