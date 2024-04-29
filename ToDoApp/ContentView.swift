//
//  ContentView.swift
//  ToDoApp
//
//  Created by Vincent on 2024/04/28.
//

import SwiftUI

struct ContentView: View {

    @State private var isPresented: Bool = false
    @Query(sort: \.id, order: .reverse) private var todos: [ToDo]

    var body: some View {
        NavigationStack {
            VStack {
                ToDoListView(todos: todos)
                    .navigationTitle("TODO App")
            }
            .sheet(isPresented: $isPresented, content: {
                AddToDoListItemScreen()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
