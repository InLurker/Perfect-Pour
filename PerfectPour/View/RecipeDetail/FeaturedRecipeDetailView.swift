import SwiftUI

struct FeaturedRecipeDetailView: View {
    
    @State private var showAlert = false
    
    @Environment(\.managedObjectContext) var objectContext
    
    let recipe: RecipeModel
    let overviewItems: [OverviewItem]
    
    init(_ recipe: RecipeModel) {
        self.recipe = recipe
        overviewItems = [
            OverviewItem(
                imageName: "measuring_cup",
                overviewCaption: "Ratio",
                overviewDetail: recipe.ratio
            ),
            OverviewItem(
                imageName: "muscle",
                overviewCaption: "Strength",
                overviewDetail: calculateStrength(ratio: recipe.ratio)
            ),
            OverviewItem(
                imageName: "thermometer",
                overviewCaption: "Temperature",
                overviewDetail: formatTemperature(recipe.temperature)
            ),
            OverviewItem(
                imageName: "grinder",
                overviewCaption: "Grind Size",
                overviewDetail: calculateGrindSize(size: recipe.grind).capitalized
            )
        ]
    }
    
    
    
    var body: some View {
        NavigationStack {
            let minimumWidth = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 0.4
            ScrollView {
                Image(uiImage: recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        height: 200,
                        alignment: .center
                    )
                    .clipped()
                VStack(alignment: .leading, spacing: 0) {
                    Text(recipe.author)
                        .font(.callout)
                        .lineLimit(1)
                        .frame(alignment: .leading)
                        .padding(.bottom, 5)
                    Text(recipe.name)
                        .font(.largeTitle)
                        .bold()
                        .frame(alignment: .leading)
                        .padding(.bottom, 25)
                    Text("Overview")
                        .font(.footnote)
                        .padding(.bottom, 10)
                    LazyVGrid (
                        columns: [GridItem(.adaptive(minimum: minimumWidth))],
                        alignment: .center
                    ) {
                        
                        ForEach(overviewItems, id: \.imageName) { item in
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    Color(
                                        red: 255/255,
                                        green: 197/255,
                                        blue: 115/255
                                    ).opacity(0.3)
                                )
                                .overlay(
                                    HStack {
                                        Circle()
                                            .fill(
                                                Color(
                                                    red: 255/255,
                                                    green: 197/255,
                                                    blue: 115/255
                                                )
                                            )
                                            .frame(width: 40, height: 40)
                                            .overlay {
                                                Image(item.imageName)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 20, height: 20)
                                                    .foregroundColor(.white)
                                            }
                                        VStack(alignment: .leading) {
                                            Text(item.overviewCaption)
                                                .font(.caption2)
                                                .bold()
                                            Text(item.overviewDetail)
                                                .font(.caption2)
                                        }
                                        Spacer()
                                    }
                                    .padding(10)
                                )
                                .frame(height: 55)
                        }
                        
                    }
                    .padding(.bottom, 25)
                    Text("Steps")
                        .font(.footnote)
                        .padding(.bottom, 10)
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(0..<recipe.steps.count, id: \.self) { stepIndex in
                            VStack (alignment: .leading, spacing: 0) {
                                Text(
                                    shortStepDescriptor(recipe.steps[stepIndex])
                                )
                                .lineLimit(nil)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .padding(15)
                                if stepIndex != recipe.steps.count - 1 {
                                    Divider()
                                }
                            }
                        }
                    }
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(15)
                }
                .frame(
                    alignment: .leading
                )
                .padding(.vertical, 15)
                .padding(.leading, 25)
                .padding(.trailing, 30)
            }
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Featured Recipe")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        showAlert = addRecipeToLibrary(objectContext: objectContext, recipeModel: recipe)
                    }) {
                        Text("Add")
                    }.alert(
                        "Recipe Added",
                        isPresented: $showAlert,
                        actions: {},
                        message: {
                            Text("The recipe was successfully added to your brew library.")
                        }
                    )
            )
        }
    }
}


struct FeaturedRecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedRecipeDetailView(featuredRecipe[0])
    }
}
