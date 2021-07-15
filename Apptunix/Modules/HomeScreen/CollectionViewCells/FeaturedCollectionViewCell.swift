//
//  FeaturedCollectionViewCell.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var featuredImageView: UIImageView!
    
    var imageData: Data?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    func configureCell(data: Data) {
        imageData = data
        featuredImageView.image = UIImage(data: imageData ?? Data())
    }
}
