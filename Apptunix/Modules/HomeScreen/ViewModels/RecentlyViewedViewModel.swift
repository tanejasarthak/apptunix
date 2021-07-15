//
//  RecentlyViewedViewModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

class RecentlyViewedViewModel {
    var recentlyViewedModel: RecentlyViewedModel?
    
    var name: String {
        return recentlyViewedModel?.name ?? ""
    }
    
    var orderCount: Int {
        return recentlyViewedModel?.orderCount ?? 0
    }
    
    var brand: String {
        return recentlyViewedModel?.brand ?? ""
    }
    
    var description: String {
        return recentlyViewedModel?.description ?? ""
    }
    
    var isBestSelling: Bool {
        return recentlyViewedModel?.isBestSelling ?? false
    }
    
    var isOutOfStock: Bool {
        return recentlyViewedModel?.isOutOfStock ?? false
    }
    
    init(recentlyViewedModel: RecentlyViewedModel) {
        self.recentlyViewedModel = recentlyViewedModel
    }
}
