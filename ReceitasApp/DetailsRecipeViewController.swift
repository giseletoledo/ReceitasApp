//
//  DetailsRecipeViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 04/07/24.
//

import UIKit

class DetailsRecipeViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
  
    @IBOutlet weak var howTo: UITextView!

    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Verifica se há uma receita atribuída
        guard let recipe = recipe else {
            return
        }
        
        // Configura os elementos da UI com os dados da receita
        imageView.image = UIImage(named: recipe.image)
        nameLabel.text = recipe.name
        authorLabel.text = recipe.author
        ingredientsTextView.text = recipe.ingredients.joined(separator: "\n")
        howTo.text = recipe.howTo.joined(separator: "\n")
    }
    
    // Exemplo de ação para o botão de favoritos
    @IBAction func favoritarButtonTapped(_ sender: UIButton) {
        // Implemente a lógica para favoritar a receita
        // Você pode usar a estrutura receita e a funcionalidade de favoritos existente
    }
}

