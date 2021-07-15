//
//  ProductCollectionViewCell.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }
    
    func configureUI() {
        mainView.layer.cornerRadius = 15
        mainView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
