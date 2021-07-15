//
//  RecentlyViewedModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

struct RecentlyViewedModel: Codable {
    var name: String?
    var orderCount: Int?
    var brand: String?
    var description: String?
    var note: String?
    var isBestSelling: Bool?
    var isOutOfStock: Bool?
  //  var productImages: String?
   // var pack: PackModel?
   // var subCategory: SubCategoryModel?
}

struct PackModel: Codable {
    var unit: String?
    var oldPrice: String?
    var availablePrice: String?
}

struct SubCategoryModel: Codable {
    var name: String?
    var image: String?
}
