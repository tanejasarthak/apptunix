//
//  TopBannersViewModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

class TopBannersViewModel {
    var topBannersModel: TopBannersModel?
    
    var image: String {
        return topBannersModel?.image ?? ""
    }
    
    var imageData: Data?
    
    var name: String {
        return topBannersModel?.name ?? ""
    }

    init(topBannersModel: TopBannersModel) {
        self.topBannersModel = topBannersModel
    }
}
