//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Vincent on 2024/04/29.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    let todos: [ToDo]
    @Environment(\.modelContext) private var context
    
    private func deleteToDo(indexSet: IndexSet) {
        indexSet.forEach { index in
            let todo = ToDo[index]
            context.delete(todo)
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(todos, id: \.id) { todo in
                NavigationLink(value: todo) {
                    VStack(alignment: .leading) {
                        Text(todo.name)
                            .font(.title3)
                        Text(todo.note)
                            .font(.caption)
                    }
                }
            }.onDelete(perform: deleteTodo)
        }.navigationDestination(for: ToDo.self) { todo in
            ToDoDetailScreen(todo: todo)
        }
    }
}

#Preview {
    ToDoListView()
//        .modelContainer(for: ToDo.self, inMemory: true)
}
