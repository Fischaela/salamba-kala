//
//  Salamba_KalaApp.swift
//  Salamba Kala WatchKit Extension
//
//  Created by Michaela Lehr on 17.10.21.
//

import SwiftUI

@main
struct Salamba_KalaApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
