//
//  ViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 04/07/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
        
        var filteredRecipes: [Recipe] = []
        var favoriteRecipes: [Recipe] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            filteredRecipes = recipes
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.searchBar.delegate = self
            
            // Ajuste a altura das células, se necessário
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 100
            
            loadFavorites()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            loadFavorites()
            tableView.reloadData()
        }
        
        func loadFavorites() {
            favoriteRecipes = recipes.filter { UserDefaults.standard.bool(forKey: "FavoriteRecipe-\( $0.name)") }
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let recipe = filteredRecipes[indexPath.row]
                    let detailsVC = segue.destination as! DetailsRecipeViewController
                    detailsVC.recipe = recipe
                }
            }
        }
    }

    extension ViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                filteredRecipes = recipes
            } else {
                filteredRecipes = recipes.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
            tableView.reloadData()
        }
    }

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredRecipes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let recipe = filteredRecipes[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath)
            
            cell.textLabel?.text = recipe.name
            cell.detailTextLabel?.text = recipe.author
            cell.imageView?.image = UIImage(named: recipe.image ?? "defaultImage")
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Perform segue programmatically
            performSegue(withIdentifier: "showDetail", sender: self)
        }
        
        // Adicionar espaço entre as células
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            let spacerView = UIView()
            spacerView.backgroundColor = .clear
            return spacerView
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 10 // Espaço entre as células
        }
    }
