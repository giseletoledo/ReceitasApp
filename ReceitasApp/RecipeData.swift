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
    var category: RecipeCategory
    var isFavorite: Bool
    var ingredients: [Ingredient]
    var howTo: [String]
    
    struct Ingredient: Codable {
        var quantity: String
        var name: String
    }
    
    // Enum for RecipeCategory
    enum RecipeCategory: String, Codable {
        case dessert = "Sobremesa"
        case snack = "Salgados"
        case fastfood = "Fast Food"
        case soup = "Sopas"
        case pasta = "Massas"
        case drinks = "Bebidas"
        
        var imageName: String {
            switch self {
            case .dessert:
                return "bolo"
            case .snack:
                return "coxinha"
            case .fastfood:
                return "hamburguer"
            case .soup:
                return "sopadetox"
            case .pasta:
                return "panqueca"
            case .drinks:
                return "sucodetox"
            }
        }
    }
}

let recipes: [Recipe] = [
    Recipe(
        name: "Bolo",
        author: "Nestlé",
        image: "bolo.jpg",
        category: .dessert,
        isFavorite: false,
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
        category: .snack,
        isFavorite: false,
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
        category: .fastfood,
        isFavorite: false,
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
        category: .fastfood,
        isFavorite: false,
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
        ),
            Recipe(
                   name: "Panqueca simples de liquidificador",
                   author: "Receitas Globo.com",
                   image: "panqueca",
                   category: .pasta,
                   isFavorite: false,
                   ingredients: [
                       Recipe.Ingredient(quantity: "1 xícara de chá", name: "leite"),
                       Recipe.Ingredient(quantity: "2", name: "ovos"),
                       Recipe.Ingredient(quantity: "1 colher de chá", name: "sal"),
                       Recipe.Ingredient(quantity: "4 colheres de sopa", name: "óleo"),
                       Recipe.Ingredient(quantity: "1 xícara e meia", name: "farinha de trigo")
                   ],
                   howTo: [
                       "No liquidificador, coloque o leite, os ovos, o sal, o óleo e a farinha de trigo;",
                       "Bata os ingredientes até a massa ficar homogênea;",
                       "Unte uma frigideira antiaderente com óleo;",
                       "Com uma concha, coloque uma porção da massa na frigideira e espalhe por toda a superfície;",
                       "Deixe dourar dos dois lados;",
                       "Use o molho e recheio de sua preferência para a panqueca e aqueça no forno antes de servir."
                   ]
               ),
               Recipe(
                   name: "Sopa detox de legumes",
                   author: "Receitas Globo.com",
                   image: "sopadetox",
                   category: .soup,
                   isFavorite: false,
                   ingredients: [
                       Recipe.Ingredient(quantity: "1", name: "cenoura"),
                       Recipe.Ingredient(quantity: "1", name: "chuchu"),
                       Recipe.Ingredient(quantity: "1 maço", name: "espinafre"),
                       Recipe.Ingredient(quantity: "1", name: "couve-flor"),
                       Recipe.Ingredient(quantity: "1 pedaço grande", name: "batata-baroa"),
                       Recipe.Ingredient(quantity: "a gosto", name: "manjericão"),
                       Recipe.Ingredient(quantity: "meia", name: "cebola roxa"),
                       Recipe.Ingredient(quantity: "1 dente", name: "alho cortado em lascas")
                   ],
                   howTo: [
                       "Cozinhar tudo com manjericão, meia cebola roxa, um dente de alho cortado em lascas e uma colher de chá de missô.",
                       "Bater todos os ingredientes no liquidificador e adicionar uma colher de azeite."
                   ]
               ),
               Recipe(
                   name: "Sopa de ervilha",
                   author: "Receitas Globo.com",
                   image: "sopaervilha",
                   category: .soup,
                   isFavorite: false,
                   ingredients: [
                       Recipe.Ingredient(quantity: "500 gramas", name: "ervilha seca"),
                       Recipe.Ingredient(quantity: "1 fio", name: "azeite"),
                       Recipe.Ingredient(quantity: "a gosto", name: "alho picado"),
                       Recipe.Ingredient(quantity: "200 gramas", name: "bacon em cubos"),
                       Recipe.Ingredient(quantity: "2", name: "linguiças calabresa em rodelas"),
                       Recipe.Ingredient(quantity: "2", name: "linguiças paio em rodelas"),
                       Recipe.Ingredient(quantity: "1 cubo", name: "caldo de bacon"),
                       Recipe.Ingredient(quantity: "2 xícaras", name: "água")
                   ],
                   howTo: [
                       "Na panela de pressão, coloque 1 fio de azeite, alho picado a gosto e deixe dourar.",
                       "Em seguida, adicione 200 gramas de bacon em cubos, 2 linguiças calabresa em rodelas e 2 linguiças paio em rodelas. Refogue.",
                       "Depois, acrescente 500 gramas de ervilha seca, 1 cubo de caldo de bacon e água suficiente para cobrir. Feche a panela de pressão e deixe cozinhar por 20 minutos.",
                       "Espere a pressão sair, abra a panela e adicione 2 xícaras de água. Cozinhe por mais 20 minutos.",
                       "Sirva em seguida."
                   ]
               ),
               Recipe(
                   name: "Suco detox de beterraba, couve e gengibre",
                   author: "Receitas Globo.com",
                   image: "sucodetox",
                   category: .drinks,
                   isFavorite: false,
                   ingredients: [
                       Recipe.Ingredient(quantity: "2 folhas", name: "couve"),
                       Recipe.Ingredient(quantity: "1 colher de sopa", name: "folhas frescas de hortelã"),
                       Recipe.Ingredient(quantity: "1", name: "beterraba"),
                       Recipe.Ingredient(quantity: "meio", name: "pepino com casca"),
                       Recipe.Ingredient(quantity: "1 colher de chá", name: "gengibre fresco ralado"),
                       Recipe.Ingredient(quantity: "1 copo", name: "água filtrada ou fervida")
                   ],
                   howTo: [
                       "Lave bem as folhas de couve, as folhas de hortelã, a beterraba e o pepino;",
                       "Descasque a beterraba;",
                       "Corte a beterraba e o pepino em cubos e coloque no liquidificador;",
                       "Adicione as folhas de couve, as folhas de hortelã e o gengibre fresco ralado ao liquidificador;",
                       "Acrescente o copo de água filtrada ou fervida e bata por cerca de 3 minutos até obter uma mistura homogênea;",
                       "Coe o suco e sirva imediatamente, sem adicionar açúcar ou adoçante;",
                       "Se desejar, armazene o suco em um recipiente bem vedado e mantenha refrigerado."
                   ]
               )
           ]
let categories: [Recipe.RecipeCategory] = [
    .dessert, .snack, .fastfood, .soup, .pasta, .drinks
]
