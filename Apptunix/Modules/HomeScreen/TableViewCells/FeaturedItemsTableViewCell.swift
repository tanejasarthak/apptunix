//
//  FeaturedItemsTableViewCell.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import UIKit

class FeaturedItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var featuredVM = [TopBannersViewModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        registerTableViewCell()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerTableViewCell() {
        collectionView.register(UINib(nibName: "FeaturedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeaturedCollectionViewCell")
    }
    
    func configureCell(featuredVM: [TopBannersViewModel]?) {
        guard let featuredVM = featuredVM else { return }
        self.featuredVM = featuredVM
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension FeaturedItemsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath) as! FeaturedCollectionViewCell
        cell.configureCell(data: featuredVM[indexPath.row].imageData ?? Data())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
