let featuredRecipe =  [
    RecipeModel(
        recipe_id: "1",
        author: "James Hoffmann",
        grind: 4,
        image: "hoffmann1cupV60",
        name: "1 Cup V60 Technique",
        ratio: "1:17",
        temperature: 100,
        steps: [
            RecipeStepModel(action: "rinse"),
            RecipeStepModel(action: "insert", extra: "create a small well in the middle of the grounds."),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "make sure that all the grounds are wet."),
            RecipeStepModel(action: "wait", amount: 45),
            RecipeStepModel(action: "swirl", extra: "gently swirl the V60."),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "from a constant low height, move the kettle in a circular motion."),
            RecipeStepModel(action: "wait", amount: 10),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "from a constant low height, move the kettle in a circular motion."),
            RecipeStepModel(action: "wait", amount: 10),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "from a constant low height, move the kettle in a circular motion."),
            RecipeStepModel(action: "wait", amount: 10),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "from a constant low height, move the kettle in a circular motion."),
            RecipeStepModel(action: "swirl", extra: "gently swirl the V60."),
            RecipeStepModel(action: "wait", extra: "until the water is drawed down.")
        ]
    ),
    RecipeModel(
        recipe_id: "2",
        author: "Tetsu Kasuya",
        grind: 1,
        image: "tetsukasuyaV60",
        name: "4:6 Method",
        ratio: "1:15",
        temperature: 90,
        steps: [
            RecipeStepModel(action: "rinse"),
            RecipeStepModel(action: "insert", extra: "create a small well in the middle of the grounds."),
            RecipeStepModel(action: "pour", amount: 0.15, extra: "pour the water in a circular motion, making sure that the grounds are wet."),
            RecipeStepModel(action: "wait", amount: 45),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "pour the water in a circular motion."),
            RecipeStepModel(action: "wait", amount: 45),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "pour the water in a circular motion."),
            RecipeStepModel(action: "wait", amount: 45),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "pour the water in a circular motion."),
            RecipeStepModel(action: "wait", amount: 45),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "pour the water in a circular motion."),
            RecipeStepModel(action: "wait", extra: "until the water is drawed down.")
        ]
    ),
    RecipeModel(
        recipe_id: "3",
        author: "Cafec",
        grind: 2,
        image: "osmoticFlow",
        name: "Osmotic Flow",
        ratio: "1:13",
        temperature: 80,
        steps: [
            RecipeStepModel(action: "rinse"),
            RecipeStepModel(action: "insert", extra: "even out the grounds, forming a flat surface."),
            RecipeStepModel(action: "pour", amount: 0.2, extra: "pour the water in a circular motion, making sure that the grounds are wet."),
            RecipeStepModel(action: "wait", amount: 30),
            RecipeStepModel(action: "pour", amount: 0.27, extra: "keep the kettle low and slowly pour the water into the center of the bed, creating a dome."),
            RecipeStepModel(action: "wait", amount: 5),
            RecipeStepModel(action: "pour", amount: 0.53, extra: "pour the water in a small circle, without disrupting the dome."),
            RecipeStepModel(action: "wait", extra: "shortly after pouring, remove the brewer before the water is completely drawed down.")
        ]
    ),
    RecipeModel(
        recipe_id: "4",
        author: "Scott Rao",
        grind: 4,
        image: "raoV60",
        name: "Rao V60 Method",
        ratio: "1:16.4",
        temperature: 100,
        steps: [
            RecipeStepModel(action: "rinse"),
            RecipeStepModel(action: "insert", extra: "create a small well in the middle of the grounds."),
            RecipeStepModel(action: "pour", amount: 0.18, extra: "make sure that all the grounds are wet."),
            RecipeStepModel(action: "swirl"),
            RecipeStepModel(action: "wait", amount: 45),
            RecipeStepModel(action: "pour", amount: 0.81, extra: "from a constant high height, move the kettle in a circular motion."),
            RecipeStepModel(action: "swirl", extra: "gently swirl the V60."),
            RecipeStepModel(action: "wait", extra: "until the water is drawed down.")
        ]
    ),
    RecipeModel(
        recipe_id: "5",
        author: "James Hoffmann",
        grind: 4,
        image: "hoffmannUltimate",
        name: "Ultimate V60 Technique",
        ratio: "1:16.7",
        temperature: 100,
        steps: [
            RecipeStepModel(action: "rinse"),
            RecipeStepModel(action: "insert", extra: "create a small well in the middle of the grounds."),
            RecipeStepModel(action: "pour", amount: 0.12, extra: "make sure that all the grounds are wet."),
            RecipeStepModel(action: "wait", amount: 45),
            RecipeStepModel(action: "swirl", extra: "gently swirl the V60."),
            RecipeStepModel(action: "pour", amount: 0.48, extra: "introduce a small amount of agitation to the coffee bed."),
            RecipeStepModel(action: "pour", amount: 0.4, extra: "pour the water slowly, keeping the cone full. you can pulse if you need to."),
            RecipeStepModel(action: "stir", extra: "with a spoon, gently stir the coffee bed once clockwise and once anti-clockwise."),
            RecipeStepModel(action: "swirl", extra: "gently swirl the V60."),
            RecipeStepModel(action: "wait", extra: "until the water is drawed down.")
        ]
    ),
    RecipeModel(
        recipe_id: "6",
        author: "Hario",
        grind: 4,
        image: "harioV60",
        name: "V60 Flexible Coffee Style",
        ratio: "1:10",
        temperature: 80,
        steps: [
            RecipeStepModel(action: "rinse"),
            RecipeStepModel(action: "insert"),
            RecipeStepModel(action: "pour", amount: 0.3, extra: "pour the water in a circular motion, making sure that the grounds are wet."),
            RecipeStepModel(action: "wait", amount: 30),
            RecipeStepModel(action: "pour", amount: 0.7, extra: "pour the water in a circular motion."),
            RecipeStepModel(action: "wait", extra: "until the water is drawed down.")
        ]
    )
]
