//
//  ViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 04/07/24.
//

import UIKit

struct Recipe {
    var name: String
    var author: String
    var image: String
    var ingredients: [String]
    var howTo: [String]
}



class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [Recipe] = [
        Recipe(
            name: "Bolo",
            author: "Gisele",
            image: "bolo.jpg",
            ingredients: [
                "Massa",
                "1 xícara (chá) de NATURE´S HEART® Bebida Vegetal de Amêndoa",
                "2 cenouras médias picadas (150 g)",
                "1 xícara (chá) de açúcar demerara",
                "1 colher (sopa) de óleo de milho",
                "1 xícara (chá) de farinha de trigo peneirada",
                "1 colher (sopa) de fermento químico em pó",
                "Brigadeiro",
                "1 caixinha de Leite MOÇA® Zero Lactose",
                "3 colheres (sopa) de Cacau em Pó 100% NESTLÉ® Chocolateria®"
            ],
            howTo: [
                "Massa",
                "1. Em um liquidificador, bata o NATURE´S HEART de Amêndoa, a cenoura, o açúcar, o óleo e o sal por 4 minutos, reserve.",
                "2. Em um recipiente, misture aos líquidos batidos a farinha de trigo sem bater muito, em seguida adicione o fermento em pó.",
                "3. Unte uma forma redonda (18 cm de diâmetro) e com furo com desmoldante ou óleo de coco, despeje a massa.",
                "4. Leve para assar em forno médio (180°C) preaquecido, por 45 minutos ou até o palito sair seco. Deixe esfriar e desenforme, reserve.",
                "Brigadeiro",
                "5. Em uma panela, misture o Leite MOÇA Zero Lactose com o Cacau em Pó. Leve ao fogo baixo, mexendo sempre até desprender do fundo da panela (cerca de 10 minutos).",
                "6. Retire do fogo e já utilize para cobrir o bolo."
            ]
        ),
        Recipe(
            name: "Coxinha",
            author: "Laura",
            image: "coxinha.jpg",
            ingredients: [
                "4 copos de água",
                "3 envelopes de caldo de galinha",
                "1 colher (sobremesa) de margarina",
                "4 copos de farinha de trigo peneirada",
                "Leite para empanar",
                "Farinha de rosca com tempero em pó de galinha para empanar",
                "Óleo para fritar",
                "Recheio",
                "1 colher (sopa) de óleo",
                "1/2 cebola picada",
                "1 dente de alho espremido",
                "1 peito de frango cozido e desfiado",
                "1 sachê de tempero em pó de galinha",
                "1 colher (sobremesa) de molho de tomate",
                "1/2 tomate picado",
                "Sal a gosto",
                "1/2 maço de salsinha picada para salpicar",
                "1/2 maço de cebolinha picada para salpicar"
            ],
            howTo: [
                "1. Ferva a água com o caldo de galinha e a margarina.",
                "2. Adicione a farinha de uma só vez, mexendo vigorosamente até desgrudar da panela. Deixe esfriar.",
                "3. Com as mãos untadas em óleo, pegue pequenas porções da massa, recheie e modele as coxinhas.",
                "4. Empane primeiro no leite e depois em farinha de rosca.",
                "5. Frite, poucas por vez, em óleo quente abundante até dourarem e deixe escorrer sobre papel absorvente."
            ]
        ),
        Recipe(
            name: "Pizza",
            author: "Roberto",
            image: "pizza.jpg",
            ingredients: [
                "6 xícaras (chá) de farinha de trigo (cerca de 840 g)",
                "2 colheres (sopa) de fermento biológico seco instantâneo (cerca de 20 g)",
                "2 colheres (chá) de açúcar",
                "2 colheres (chá) de sal",
                "2½ xícaras (chá) de água morna",
                "¼ de xícara (chá) de azeite",
                "farinha de trigo para polvilhar a bancada",
                "azeite para untar a tigela"
            ],
            howTo: [
                "1. Numa tigela, misture o fermento e o açúcar. Regue com a água morna e, com uma colher, misture bem para dissolver. Deixe em temperatura ambiente até espumar – cerca de 5 minutos.",
                "2. Enquanto isso, na tigela da batedeira, misture a farinha com o sal e abra um buraco no centro. Separe uma tigela ou outro recipiente grande e unte com 2 colheres (sopa) de azeite – ela tem que ter espaço suficiente para a massa crescer bastante."
            ]
        ),
        Recipe(
            name: "Hambúrguer",
            author: "Chef Exemplo",
            image: "hamburguer.jpg",
            ingredients: [
                "Hambúrguer",
                "meio quilo de acém moído",
                "meio quilo de patinho moído",
                "1 envelope de MAGGI® Creme de Cebola",
                "2 borrifadas de fumaça líquida",
                "Montagem",
                "6 pães de hambúrguer",
                "6 fatias de queijo prato",
                "12 fatias de bacon",
                "12 fatias de picles",
                "6 rodelas de tomate",
                "6 folhas de alface"
            ],
            howTo: [
                "1. Misture o acém e o patinho moídos com o envelope de MAGGI® Creme de Cebola e as borrifadas de fumaça líquida.",
                "2. Modele a mistura em 6 hambúrgueres.",
                "3. Grelhe os hambúrgueres até o ponto desejado.",
                "4. Monte os hambúrgueres com os pães, queijo, bacon, picles, tomate e alface."
            ]
        )
    ]

    var FilteredRecipes: [Recipe] = []
        var FavoriteRecipes: [Recipe] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            FilteredRecipes = recipes
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.searchBar.delegate = self
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let recipe = FilteredRecipes[indexPath.row]
                    let detailsVC = segue.destination as! DetailsRecipeViewController
                    detailsVC.recipe = recipe
                }
            }
        }
    }

    extension ViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                FilteredRecipes = recipes
            } else {
                FilteredRecipes = recipes.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
            
            tableView.reloadData()
        }
    }

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return FilteredRecipes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let recipe = FilteredRecipes[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath)
            
            cell.textLabel?.text = recipe.name
            cell.detailTextLabel?.text = recipe.author
            cell.imageView?.image = UIImage(named: recipe.image)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetail", sender: self)
        }
    }
