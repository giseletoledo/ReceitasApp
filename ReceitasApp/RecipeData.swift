//
//  RecipeData.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 06/07/24.
//

import Foundation

struct Recipe: Codable {
    var name: String
    var author: String
    var image: String?
    var category: String
    var ingredients: [Ingredient]
    var howTo: [String]
    
    struct Ingredient: Codable {
        var quantity: String
        var name: String
    }
}

let recipes: [Recipe] = [
    Recipe(
        name: "Bolo",
        author: "Nestlé",
        image: "bolo.jpg",
        category: "Dessert",
        ingredients: [
            Recipe.Ingredient(quantity: "1 xícara (chá)", name: "de NATURE´S HEART® Bebida Vegetal de Amêndoa"),
            Recipe.Ingredient(quantity: "2", name: "cenouras médias picadas (150 g)"),
            Recipe.Ingredient(quantity: "1 xícara (chá)", name: "de açúcar demerara"),
            Recipe.Ingredient(quantity: "1 colher (sopa)", name: "de óleo de milho"),
            Recipe.Ingredient(quantity: "1 xícara (chá)", name: "de farinha de trigo peneirada"),
            Recipe.Ingredient(quantity: "1 colher (sopa)", name: "de fermento químico em pó"),
            Recipe.Ingredient(quantity: "", name: "Brigadeiro"),
            Recipe.Ingredient(quantity: "1 caixinha", name: "de Leite MOÇA® Zero Lactose"),
            Recipe.Ingredient(quantity: "3 colheres (sopa)", name: "de Cacau em Pó 100% NESTLÉ® Chocolateria®")
        ],
        howTo: [
            "Massa",
            "Em um liquidificador, bata o NATURE´S HEART de Amêndoa, a cenoura, o açúcar, o óleo e o sal por 4 minutos, reserve.",
            "Em um recipiente, misture aos líquidos batidos a farinha de trigo sem bater muito, em seguida adicione o fermento em pó.",
            "Unte uma forma redonda (18 cm de diâmetro) e com furo com desmoldante ou óleo de coco, despeje a massa.",
            "Leve para assar em forno médio (180°C) preaquecido, por 45 minutos ou até o palito sair seco. Deixe esfriar e desenforme, reserve.",
            "Brigadeiro",
            "Em uma panela, misture o Leite MOÇA Zero Lactose com o Cacau em Pó. Leve ao fogo baixo, mexendo sempre até desprender do fundo da panela (cerca de 10 minutos).",
            "Retire do fogo e já utilize para cobrir o bolo."
        ]
    ),
    Recipe(
        name: "Coxinha",
        author: "Receitas Globo.com",
        image: "coxinha.jpg",
        category: "Snack",
        ingredients: [
            Recipe.Ingredient(quantity: "4 copos", name: "água"),
            Recipe.Ingredient(quantity: "3 envelopes", name: "caldo de galinha"),
            Recipe.Ingredient(quantity: "1 colher (sobremesa)", name: "margarina"),
            Recipe.Ingredient(quantity: "4 copos de farinha", name: "trigo peneirada"),
            Recipe.Ingredient(quantity: "1 copo", name: "leite"),
            Recipe.Ingredient(quantity: "1 xícara", name: "Farinha de rosca com tempero em pó de galinha para empanar"),
            Recipe.Ingredient(quantity: "1 xícara", name: "Óleo"),
            Recipe.Ingredient(quantity: "1 colher (sopa)", name: "Óleo"),
            Recipe.Ingredient(quantity: "1/2 pedaço", name: "cebola picada"),
            Recipe.Ingredient(quantity: "1 dente", name: "alho espremido"),
            Recipe.Ingredient(quantity: "1 peito", name: "frango cozido e desfiado"),
            Recipe.Ingredient(quantity: "1 sachê", name: "tempero em pó de galinha"),
            Recipe.Ingredient(quantity: "1 colher (sobremesa)", name: "molho de tomate"),
            Recipe.Ingredient(quantity: "1/2 pedaço", name: "tomate picado"),
            Recipe.Ingredient(quantity: "1/2 maço", name: "salsinha picada para salpicar"),
            Recipe.Ingredient(quantity: "1/2 maço", name: "cebolinha picada para salpicar")
        ],
        howTo: [
            "Ferva a água com o caldo de galinha e a margarina.",
            "Adicione a farinha de uma só vez, mexendo vigorosamente até desgrudar da panela. Deixe esfriar.",
            "Com as mãos untadas em óleo, pegue pequenas porções da massa, recheie e modele as coxinhas.",
            "Empane primeiro no leite e depois em farinha de rosca.",
            "Frite, poucas por vez, em óleo quente abundante até dourarem e deixe escorrer sobre papel absorvente."
        ]
    ),
    Recipe(
        name: "Pizza",
        author: "Panelinha",
        image: "pizza.jpg",
        category: "Main Course",
        ingredients: [
            Recipe.Ingredient(quantity: "6 xícaras (chá)", name: "farinha de trigo"),
            Recipe.Ingredient(quantity: "2 colheres (sopa)", name: "fermento biológico seco instantâneo"),
            Recipe.Ingredient(quantity: "2 colheres (chá)", name: "açúcar"),
            Recipe.Ingredient(quantity: "2 colheres (chá)", name: "sal"),
            Recipe.Ingredient(quantity: "2½ xícaras (chá)", name: "água morna"),
            Recipe.Ingredient(quantity: "¼ de xícara (chá)", name: "azeite")
        ],
        howTo: [
            "Numa tigela, misture o fermento e o açúcar. Regue com a água morna e, com uma colher, misture bem para dissolver. Deixe em temperatura ambiente até espumar – cerca de 5 minutos.",
            "Enquanto isso, na tigela da batedeira, misture a farinha com o sal e abra um buraco no centro. Separe uma tigela ou outro recipiente grande e unte com 2 colheres (sopa) de azeite – ela tem que ter espaço suficiente para a massa crescer bastante."
        ]
    ),
    Recipe(
        name: "Hambúrguer",
        author: "Nestlé",
        image: "hamburguer.jpg",
        category: "Main Course",
        ingredients: [
            Recipe.Ingredient(quantity: "meio quilo", name: "Acém moído"),
            Recipe.Ingredient(quantity: "meio quilo", name: "Patinho moído"),
            Recipe.Ingredient(quantity: "1 envelope", name: "MAGGI® Creme de Cebola"),
            Recipe.Ingredient(quantity: "2 borrifadas", name: "Fumaça líquida"),
            Recipe.Ingredient(quantity: "6", name: "Pães de hambúrguer"),
            Recipe.Ingredient(quantity: "6 fatias", name: "Queijo prato"),
            Recipe.Ingredient(quantity: "12 fatias", name: "Bacon"),
            Recipe.Ingredient(quantity: "12 fatias", name: "Picles"),
            Recipe.Ingredient(quantity: "6", name: "Rodelas de tomate"),
            Recipe.Ingredient(quantity: "6 folhas", name: "Alface")
        ],
        howTo: [
            "Misture o acém e o patinho moídos com o envelope de MAGGI® Creme de Cebola e as borrifadas de fumaça líquida.",
            "Modele a mistura em 6 hambúrgueres.",
            "Grelhe os hambúrgueres até o ponto desejado.",
            "Monte os hambúrgueres com os pães, queijo, bacon, picles, tomate e alface."
        ]
    )
]
