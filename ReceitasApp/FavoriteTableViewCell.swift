//
//  FavoriteTableViewCell.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 07/07/24.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!

    var isFavorite: Bool = false {
        didSet {
            let heartImage = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
            favoriteButton.setImage(heartImage, for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
