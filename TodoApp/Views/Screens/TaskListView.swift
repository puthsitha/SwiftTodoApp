//
//  TaskListView.swift
//  TodoApp
//
//  Created by Puthsitha Moeurn on 20/8/25.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    var body: some View {
        ZStack {
            if taskViewModel.taskData.isEmpty {
                EmptyView()
                    .transition(.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(taskViewModel.taskData) { task in
                        TaskItem(task: task)
                            .onTapGesture {
                                withAnimation(.linear){
                                    taskViewModel.updateTask(task: task)
                                }
                            }
                    }
                    .onDelete(perform: taskViewModel.deleteTask)
                    .onMove(perform: taskViewModel.moveTask)
                }
                .listStyle(DefaultListStyle())
            }
        }
        .navigationTitle("To Do List 📋")
        .toolbar {
//            ToolbarItem(placement: .principal) {
//                HStack(spacing: 8) {
//                    Text("To Do List")
//                        .font(.headline)
//                        .bold()
//                        .foregroundColor(.primary)
//                }
//            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                    .disabled(taskViewModel.taskData.isEmpty)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    TaskCreateView()
                } label: {
                    Text("Add")
                }
            }
        }
        .onAppear {
            print("📱 TaskListView is now visible on screen")
        }
        .onDisappear {
            print("👋 TaskListView is no longer visible")
        }
    }
}

#Preview {
    NavigationStack{
        TaskListView()
    }
    .environmentObject(TaskViewModel())
}
