//
//  CollectionViewCell.swift
//  ShoppingUI
//
//  Created by Indium Software on 21/12/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    
    class var reuseIdentifier: String {
        return "CollectionViewCellReuse"
    }
    class var nibName: String {
        return "CollectionViewCell"
    }
    
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configureCell(name: String) {
        self.categoryLabel.text = name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
