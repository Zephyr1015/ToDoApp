//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Vincent on 2024/04/28.
//

import SwiftUI
import SwiftData

@main
struct ToDoApp: App {
    var body: some Scene {
        WindowGroup {
//            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
        .modelContainer(for: [ToDo.self])
    }
}
