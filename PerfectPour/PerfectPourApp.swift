

import SwiftUI

@main
struct PerfectPourApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
