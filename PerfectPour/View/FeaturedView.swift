import SwiftUI

struct FeaturedView: View {
    @State private var searchText = ""
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .systemOrange
    }
    
    var body: some View {
        NavigationStack {
            let minimumWidth = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 0.9
            ScrollView{
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: minimumWidth))],
                    alignment: .leading,
                    spacing: 15
                ){
                    ForEach(searchResults, id: \.recipe_id) { recipe in
                        NavigationLink(
                            destination: FeaturedRecipeDetailView(recipe),
                            label: {
                                FeaturedRecipeCollectionView(
                                    recipe: recipe,
                                    frameWidth: minimumWidth
                                )
                            }
                        )
                    }
                }
            }
            .padding(20)
            .scrollIndicators(.hidden)
            .navigationBarTitle("Featured")
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: AddBrewRecipeView()) {
                        Image(systemName: "slider.horizontal.3")
                    }
            )
            .searchable(text: $searchText)
        }
    }
    
    var searchResults: [RecipeModel] {
        if searchText.isEmpty {
            return featuredRecipe
        }
        return featuredRecipe.filter { recipe in
            recipe.name.contains(searchText) || recipe.author.contains(searchText)
        }
    }
}



struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
