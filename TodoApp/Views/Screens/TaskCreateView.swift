//
//  TaskCreateView.swift
//  TodoApp
//
//  Created by Puthsitha Moeurn on 20/8/25.
//

import SwiftUI

struct TaskCreateView: View {
    
    // MARK: PROPERTIES
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var taskViewModel: TaskViewModel
    @State var newTask: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    //  MARK: BODY
    var body: some View {
        ScrollView{
            VStack{
                TextField("Adding task, typing your task...", text: $newTask)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .focused($isTextFieldFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        addTask()
                    }

                
                Button {
                    addTask()
                } label: {
                    Text("Save".capitalized)
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle("Add Task ✍️")
        .alert(alertTitle, isPresented: $showAlert){
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                isTextFieldFocused = true
            }
        }
    }
    
//    MARK: FUNCTION
    func addTask(){
        if(valideTask()){
            taskViewModel.createTask(title: newTask)
            dismiss()
        }
    }
    
    func valideTask() -> Bool {
        if (newTask.count > 3) {
            return true
        }
        alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
        showAlert.toggle()
        return false
    }
}

#Preview {
    NavigationStack{
        TaskCreateView()
    }
    .environmentObject(TaskViewModel())
}
