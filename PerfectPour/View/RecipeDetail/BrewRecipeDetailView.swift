import SwiftUI

struct BrewRecipeDetailView: View {
    
    @State private var segmentedSelection = 0
    @State private var coffee: String = "30"
    @State private var water: String = ""
    @State private var isCoffeeSelected: Bool = true
    
    let brewRatio: Double
    let recipe: Recipe
    let overviewItems: [OverviewItem]
    let image: UIImage
    init(_ recipe: Recipe, _ image: UIImage) {
        self.recipe = recipe
        self.brewRatio = parseRatio(recipe.ratio ?? "0:0") ?? 0
        self.coffee = "30"
        self.water = String(Int((30.0/brewRatio).rounded()))
        self.image = image
        
        overviewItems = [
            OverviewItem(
                imageName: "measuring_cup",
                overviewCaption: "Ratio",
                overviewDetail: recipe.ratio ?? "0:0"
            ),
            OverviewItem(
                imageName: "muscle",
                overviewCaption: "Strength",
                overviewDetail: calculateStrength(ratio: recipe.ratio ?? "0:0")
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
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        height: 200,
                        alignment: .center
                    )
                    .clipped()
                VStack(alignment: .leading, spacing: 0) {
                    Text(recipe.author ?? "Author")
                        .font(.callout)
                        .lineLimit(1)
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    Text(recipe.name ?? "Recipe Name")
                        .font(.largeTitle)
                        .bold()
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 15)
                    
                    Text("Brew Calculator")
                        .font(.footnote)
                        .padding(.bottom, 10)
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .bold()
                    
                    Text("Enter the value in your preferred text field, and watch as the value is automatically calculated for you.")
                        .font(.caption)
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)
                    VStack() {
                        Picker (
                            "Select your",
                            selection: $segmentedSelection
                        ){
                            Text("Coffee").tag(0)
                            Text("Water").tag(1)
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: segmentedSelection) { newSelection in
                            isCoffeeSelected = (newSelection == 0 ? true : false)
                        }
                        HStack(alignment: .center, spacing: 0) {
                            HStack(alignment: .firstTextBaseline, spacing: 0) {
                                Spacer()
                                TextField("Coffee",
                                          text:
                                            Binding(
                                                get: { coffee },
                                                set: { newValue in
                                                    
                                                    let truncatedText = String(newValue.prefix(3))
                                                    let filteredText = truncatedText.filter { $0.isNumber}
                                                    let coffeeWeight = Int(filteredText) ?? 0
                                                    coffee = String(coffeeWeight)
                                                    
                                                    water = brewYieldCalculator(coffee: coffeeWeight)
                                                }
                                            )
                                )
                                .font(.title)
                                .frame(minWidth: 25, alignment: .center)
                                .fixedSize(horizontal: false, vertical: false)
                                .keyboardType(.numberPad)
                                Text("g")
                                    .font(.title)
                                    .frame(alignment: .center)
                                Spacer()
                            }
                            .multilineTextAlignment(.center)
                            .foregroundColor((isCoffeeSelected ? .primary : .secondary))
                            .disabled(!isCoffeeSelected)
                            .padding(.horizontal, 5)
                            .padding(15)
                            Divider()
                            HStack(alignment: .firstTextBaseline, spacing: 0) {
                                TextField("Water",
                                          text:
                                            Binding(
                                                get: { water },
                                                set: { newValue in
                                                    
                                                    let truncatedText = String(newValue.prefix(3))
                                                    let filteredText = truncatedText.filter { $0.isNumber}
                                                    let waterVolume = Int(filteredText) ?? 0
                                                    water = String(waterVolume)
                                                    
                                                    coffee = brewYieldCalculator(water: waterVolume)
                                                }
                                            )
                                )
                                .font(.title)
                                .frame(minWidth: 25, alignment: .center)
                                .fixedSize(horizontal: false, vertical: false)
                                .keyboardType(.numberPad)
                                Text("ml")
                                    .font(.title)
                                    .frame(alignment: .center)
                                Spacer()
                            }
                            .padding(15)
                            .multilineTextAlignment(.center)
                            .foregroundColor((isCoffeeSelected ? .secondary : .primary))
                            .disabled(isCoffeeSelected)
                        }
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        Button(action: {
                            
                        }) {
                            Spacer()
                            Text("Start Brewing")
                                .font(.callout)
                                .bold()
                                .padding(.vertical, 1)
                            Spacer()
                        }
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(10)
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 25)
                    
                    Text("Overview")
                        .font(.footnote)
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
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
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)
                    VStack(alignment: .leading, spacing: 0) {
                        if let steps = recipe.steps as? Set<RecipeStep> {
                            ForEach(Array(steps.sorted { $0.order < $1.order }.enumerated()), id: \.element) { index, step in
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(
                                        shortRecipeStepDescriptor(step)
                                    )
                                    .lineLimit(nil)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .padding(15)
                                    if index < (steps.count - 1) {
                                        Divider()
                                    }
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
            .navigationBarTitle("Brew Recipe")
        }
    }
    
    func brewYieldCalculator(coffee: Int) -> String {
        return String(Int((Double(coffee)/brewRatio).rounded()))
    }
    
    func brewYieldCalculator(water: Int) -> String {
        return String(Int((Double(water)*brewRatio).rounded()))
    }
}
