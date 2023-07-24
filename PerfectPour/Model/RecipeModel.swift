import Foundation
import UIKit

struct RecipeModel: Equatable {
    static func == (lhs: RecipeModel, rhs: RecipeModel) -> Bool {
        return lhs.recipe_id == rhs.recipe_id
    }
    var recipe_id: String
    var author: String
    var grind: Int16
    var image: UIImage
    var name: String
    var ratio: String
    var temperature: Int16
    var steps: [RecipeStepModel]
    
    init(
        recipe_id: String,
        author: String,
        grind: Int16,
        image: String,
        name: String,
        ratio: String,
        temperature: Int16,
        steps: [RecipeStepModel]
    ) {
        self.recipe_id = recipe_id
        self.author = author
        self.grind = grind
        self.image = UIImage(named: image)!
        self.name = name
        self.ratio = ratio
        self.temperature = temperature
        self.steps = steps
    }
}

struct RecipeStepModel {
    var action: String
    var amount: Float?
    var extra: String?
}

