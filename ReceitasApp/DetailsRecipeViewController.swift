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
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var recipe: Recipe?
    var isFavorited = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 8
    }
    
    func setupUI() {
        guard let recipe = recipe else { return }
        
        imageView.image = UIImage(named: recipe.image ?? "defaultImage")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        nameLabel.text = recipe.name
        authorLabel.text = recipe.author
        
        // Verifica se a receita está favoritada
        isFavorited = UserDefaults.standard.bool(forKey: "FavoriteRecipe-\(recipe.name)")
        updateFavoriteButton()
    }
    
    func updateFavoriteButton() {
        let heartImage = isFavorited ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        favoriteButton.setImage(heartImage, for: .normal)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        guard let recipe = recipe else { return }
        isFavorited.toggle()
        updateFavoriteButton()
        
        // Salva ou remove dos favoritos
        if isFavorited {
            UserDefaults.standard.set(true, forKey: "FavoriteRecipe-\(recipe.name)")
        } else {
            UserDefaults.standard.removeObject(forKey: "FavoriteRecipe-\(recipe.name)")
        }
        UserDefaults.standard.synchronize()
    }
    
    func configureCellCorners(for cell: UITableViewCell, at indexPath: IndexPath) {
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        
        if numberOfRows == 1 {
            // Se há apenas uma célula na seção
            cell.layer.cornerRadius = 12
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else if indexPath.row == 0 {
            // Primeira célula da seção depois do cabeçalho
            cell.layer.cornerRadius = 12
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else if indexPath.row == numberOfRows - 1 {
            // Última célula da seção
            cell.layer.cornerRadius = 12
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            // Outras células
            cell.layer.cornerRadius = 0
        }
        
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
    }
}

extension DetailsRecipeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return recipe?.ingredients.count ?? 0
        } else {
            return recipe?.howTo.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
            let ingredient = recipe?.ingredients[indexPath.row]
            cell.textLabel?.text = "\(ingredient?.quantity ?? "") \(ingredient?.name ?? "")"
            cell.textLabel?.numberOfLines = 0 // Permitir múltiplas linhas
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.contentView.backgroundColor = UIColor.white
            cell.contentView.layer.cornerRadius = 12

            // Configurar cantos arredondados para a célula
            configureCellCorners(for: cell, at: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HowToCell", for: indexPath)
            let stepNumber = "\(indexPath.row + 1)"
            let stepText = " \(recipe?.howTo[indexPath.row] ?? "")"
            
            // Create attributed string with background color for step number
            let attributedText = NSMutableAttributedString(string: stepNumber, attributes: [NSAttributedString.Key.backgroundColor: UIColor.lightGray.withAlphaComponent(0.3)])
            attributedText.append(NSAttributedString(string: stepText))
            
            cell.textLabel?.attributedText = attributedText
            cell.textLabel?.numberOfLines = 0 // Allow multiple lines for instructions
            
            // Configurar cantos arredondados para a célula
            configureCellCorners(for: cell, at: indexPath)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Ingredientes".uppercased() : "Modo de Preparo".uppercased()
    }
}
