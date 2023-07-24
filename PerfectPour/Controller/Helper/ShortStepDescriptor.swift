func shortStepDescriptor(_ step: RecipeStepModel) -> String {
    switch(step.action) {
    case "rinse":
        return "Rinse and prewet filter."
    case "insert":
        return "Insert coffee grounds."
    case "wait":
        if let time = step.amount, time != -1 {
            return "Wait \(formatFloat(time)) seconds."
        }
        if var extra = step.extra {
            if !extra.hasSuffix(".") {
                extra.append(".")
            }
            return "Wait \(extra)"
        }
        return "Wait for a moment."
    case "pour":
        if let percent = step.amount, percent != -1 {
            return "Pour \(formatFloat(percent*100))% of brew water."
        }
        return "Pour water"
    case "swirl":
        return "Swirl the V60 cone."
    case "stir":
        return "Stir the coffee bed."
    default:
        return step.action
    }
}


func shortRecipeStepDescriptor(_ recipeStep: RecipeStep) -> String {
    switch(recipeStep.action) {
    case "rinse":
        return "Rinse and prewet filter."
    case "insert":
        return "Insert coffee grounds."
    case "wait":
        if recipeStep.amount != -1 {
            return "Wait \(formatFloat(recipeStep.amount)) seconds."
        }
        if var extra = recipeStep.extra {
            if !extra.hasSuffix(".") {
                extra.append(".")
            }
            return "Wait \(extra)"
        }
        return "Wait for a moment."
    case "pour":
        if recipeStep.amount != -1 {
            return "Pour \(formatFloat(recipeStep.amount*100))% of brew water."
        }
        return "Pour water"
    case "swirl":
        return "Swirl the V60 cone."
    case "stir":
        return "Stir the coffee bed."
    default:
        return recipeStep.action ?? "Step"
    }
}
