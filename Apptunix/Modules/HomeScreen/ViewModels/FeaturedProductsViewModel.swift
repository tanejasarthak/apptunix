//
//  FeaturedProductsViewModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

class FeaturedProductsViewModel {
    var featuredProductsModel: FeaturedProductsModel?
    
    var imageData: Data?
    
    var name: String {
        return featuredProductsModel?.name ?? ""
    }
    
    var orderCount: Int {
        return featuredProductsModel?.orderCount ?? 0
    }
    
    var brand: String {
        return featuredProductsModel?.brand ?? ""
    }
    
    var price: Int {
        return featuredProductsModel?.price ?? 0
    }
    
    var description: String {
        return featuredProductsModel?.description ?? ""
    }
    
    var image: String {
        return featuredProductsModel?.productImages?[0].image ?? ""
    }
    
    init(featuredProductsModel: FeaturedProductsModel) {
        self.featuredProductsModel = featuredProductsModel
    }
}
