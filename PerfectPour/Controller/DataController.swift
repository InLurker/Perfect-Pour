import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BrewLib")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
}
