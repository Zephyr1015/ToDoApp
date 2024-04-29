//
//  AddToDoListItemScreen.swift
//  ToDoApp
//
//  Created by Vincent on 2024/04/29.
//

import SwiftUI
import SwiftData

struct AddToDoListItemScreen: View {
    @State private var name = ""
    @State private var noteDiscription = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    private var isFormValid: Bool {
        !name.isEmpty && !noteDiscription.isEmpty
    }
    
    var body: some View {
        NavigationLink {
            Form {
                TextField("Enter title", text: $name)
                TextField("Enter your notes", text: $noteDiscription)
                Button("Save") {
                    let todo = ToDo(name: name, note: noteDiscription)
                    context.insert(todo)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                }.disabled(!isFormValid)
            }
            .navigationTitle("Add todo item")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddToDoListItemScreen()
}
