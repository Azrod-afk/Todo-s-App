import SwiftUI
import SwiftData

@main
struct Todo_s_AppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Todo.self,
            TodoList.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
