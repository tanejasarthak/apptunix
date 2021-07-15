//
//  CategoriesModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

struct CategoriesModel: Codable {
    var name: String?
    var image: String?
    var deliveryBy: String?
    var subCategoryData: [SubCategoryModel]?
}

struct SubCategoriesModel: Codable {
    var name: String?
    var image: String?
}
