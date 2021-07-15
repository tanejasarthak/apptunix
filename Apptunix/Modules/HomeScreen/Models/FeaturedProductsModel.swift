//
//  FeaturedProductsModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

struct FeaturedProductsModel: Codable {
    var name: String?
    var orderCount: Int?
    var brand: String?
    var price: Int?
    var description: String?
//    var subCategory: SubCategoryModel?
    var productImages: [ProductImagesModel]?
}

struct ProductImagesModel: Codable {
    var image: String?
}
