//
//  BookWormApp.swift
//  BookWorm
//
//  Created by berat can beduk on 12.12.2022.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                
        }
    }
}
