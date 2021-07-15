//
//  CategoriesTableViewCell.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 14/07/21.
//

import UIKit

protocol CategoriesTableViewCellDelegate {
    func expandTableViewCell(shouldExpand: Bool)
}

class CategoriesTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var expandBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Public Properties
    var delegate: CategoriesTableViewCellDelegate?
    var featuredVM = [FeaturedProductsViewModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCollectionViewCells()
        
        collectionView.isHidden = true
        expandBtn.isSelected = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCollectionViewCells() {
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    
    @IBAction func expandBtnTapped() {
        expandBtn.isSelected = !expandBtn.isSelected
        if expandBtn.isSelected {
            collectionView.isHidden = false
        } else {
            collectionView.isHidden = true
        }
        delegate?.expandTableViewCell(shouldExpand: expandBtn.isSelected)
    }
    
    func configureCell(featuredVM: [FeaturedProductsViewModel]?) {
        guard let featuredVM = featuredVM else { return }
        self.featuredVM = featuredVM
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.configureView(vm: featuredVM[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3.2, height: collectionView.frame.height / 2.5)
    }
}
