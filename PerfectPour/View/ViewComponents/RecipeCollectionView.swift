import SwiftUI


struct RecipeCollectionView: View {
    let recipe: Recipe
    let image: Image
    let frameWidth: CGFloat
    var body: some View {
        VStack(alignment: .leading){
            image
                .resizable()
                .scaledToFit()
                .frame(
                    width: frameWidth,
                    height: frameWidth
                )
                .cornerRadius(25)
            Text(recipe.name ?? "Recipe Name")
                .font(.callout)
                .bold()
                .lineLimit(1)
                .padding(.leading, 5)
                .frame(
                    width: frameWidth-5,
                    alignment: .leading
                )
            Text(recipe.author ?? "Recipe Author")
                .font(.caption)
                .padding(.leading, 5)
                .frame(
                    width: frameWidth-5,
                    alignment: .leading
                )
                .lineLimit(1)
        }
        .frame(width: frameWidth)
        .padding(.bottom, 5)
        .foregroundColor(.primary)
    }
}

