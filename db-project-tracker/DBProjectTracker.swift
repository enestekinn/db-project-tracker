//
//  db_project_trackerApp.swift
//  db-project-tracker
//
//  Created by Enes Tekin on 7.07.2024.
//

import SwiftUI
import SwiftData

@main
struct DBProjectTracker: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self,ProjectUpdate.self])
        }
    }
}
