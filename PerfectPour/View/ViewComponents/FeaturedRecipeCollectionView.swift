import SwiftUI

struct FeaturedRecipeCollectionView: View {
    
    @Environment(\.managedObjectContext) var objectContext
    
    @State private var showAlert = false
    
    let recipe: RecipeModel
    let frameWidth: CGFloat
    
    var body: some View {
        HStack{
            Image(uiImage: recipe.image)
                .resizable()
                .frame(
                    width: frameWidth*0.4,
                    height: frameWidth*0.4
                )
                .scaledToFit()
                .cornerRadius(25)
            VStack(alignment: .leading) {
                Text(recipe.author)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .frame(
                        width: frameWidth * 0.55,
                        alignment: .leading
                    )
                Text(recipe.name)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .bold()
                    .lineLimit(1)
                    .frame(
                        width: frameWidth * 0.55,
                        alignment: .leading
                    )
                Text(calculateStrength(ratio: recipe.ratio))
                    .font(.caption)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .frame(
                        width: frameWidth * 0.55,
                        alignment: .leading
                    )
                Spacer()
                Button(action:{
                    showAlert = addRecipeToLibrary(objectContext: objectContext, recipeModel: recipe)
                }){
                    Text("Add")
                        .padding(.horizontal, 3)
                }
                .buttonStyle(.bordered)
                .cornerRadius(15)
                .controlSize(.small)
                .alert(
                    "Recipe Added",
                    isPresented: $showAlert,
                    actions: {},
                    message: {
                        Text("The recipe was successfully added to your brew library.")
                    }
                )
            }
            .padding(.top, 5)
            .padding(.bottom, 10)
        }
        
        .frame(width: frameWidth)
    }
}
