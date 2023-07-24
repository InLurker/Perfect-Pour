import CoreData

func addRecipeToLibrary(objectContext: NSManagedObjectContext, recipeModel: RecipeModel) -> Bool {
    let newRecipe = Recipe(context: objectContext)
    newRecipe.name = recipeModel.name
    newRecipe.author = recipeModel.author
    newRecipe.grind = Int16(recipeModel.grind)
    newRecipe.ratio = recipeModel.ratio
    newRecipe.steps = newRecipe.mutableSetValue(forKey: "steps")
    for (index, step) in recipeModel.steps.enumerated() {
        let newStep = RecipeStep(context: objectContext)
        newStep.order = Int16(index)
        newStep.action = step.action
        newStep.amount = step.amount ?? -1
        newStep.extra = step.extra
        newStep.parentRecipe = newRecipe
        newRecipe.addToSteps(newStep)
    }
    
    if let jpegImageData = recipeModel.image.jpegData(compressionQuality: 1.0) {
        newRecipe.image = jpegImageData
        do {
            try objectContext.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    else {
        print("Error converting image to JPEG data.")
    }
    return false
}
