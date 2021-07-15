//
//  CateogiesViewModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

class CategoriesViewModel {
    var categoriesModel: CategoriesModel?
    
    var name: String {
        return categoriesModel?.name ?? ""
    }
    
    var image: String {
        return categoriesModel?.image ?? ""
    }
    
    var imageData: Data?
    var subCategoryImageData: Data?
    
    var subCategoriesArr: [SubCategoryModel] {
        return categoriesModel?.subCategoryData ?? [SubCategoryModel()]
    }
    
    init(categoriesModel: CategoriesModel) {
        self.categoriesModel = categoriesModel
    }
}
