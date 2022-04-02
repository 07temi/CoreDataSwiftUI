//
//  CoreDataSwiftUIApp.swift
//  CoreDataSwiftUI
//
//  Created by Артем Черненко on 02.04.2022.
//

import SwiftUI

@main
struct CoreDataSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            StartScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
