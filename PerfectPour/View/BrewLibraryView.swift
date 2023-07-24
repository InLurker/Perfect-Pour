import SwiftUI

struct BrewLibraryView: View {
    
    @FetchRequest(
        entity: Recipe.entity(),
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \Recipe.objectID,
                ascending: true
            )
        ]
    )
    private var recipes: FetchedResults<Recipe>
    @State private var isEditMode = false
    @State var searchText = ""
    private var minimumWidth: CGFloat
    @Environment(\.managedObjectContext) private var objectContext
    
    init() {
        minimumWidth = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 0.45
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: minimumWidth))],
                    alignment: .center
                ) {
                    ForEach(searchResults) { recipe in
                        if let imageData = recipe.image,
                           let uiImage = UIImage(data: imageData) {
                            NavigationLink(destination: BrewRecipeDetailView(recipe, uiImage)) {
                                RecipeCollectionView(recipe: recipe, image: Image(uiImage: uiImage), frameWidth: minimumWidth)
                            }
                        }
                    }
                }
            }
            .padding(15)
            .scrollIndicators(.hidden)
            .navigationBarTitle("Brew Library")
            .navigationBarItems(
                leading:
                    Button(action: {
                        isEditMode.toggle()
                    }) {
                        Text(isEditMode ? "Done" : "Edit")
                    },
                trailing:
                    NavigationLink(destination: AddBrewRecipeView()) {
                        Image(systemName: "plus")
                    }
            )
            .searchable(text: $searchText)
        }
    }
    
    
    var searchResults: Array<Recipe> {
        if searchText.isEmpty {
            return Array(recipes)
        }
        return recipes.filter { recipe in
            if let name = recipe.name, let author = recipe.author {
                return name.contains(searchText) || author.contains(searchText)
            } else {
                return false
            }
        }
    }
    
    func createRecipe(name: String) {
        let newItem = Recipe(context: objectContext)
        newItem.name = name
        
        do {
            try objectContext.save()
        }
        catch {
            
        }
    }
    
    func deleteRecipe(recipe: Recipe) {
        do {
            try objectContext.save()
        }
        catch {
            
        }
    }
}
