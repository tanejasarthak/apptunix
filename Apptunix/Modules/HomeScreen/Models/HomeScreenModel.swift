//
//  HomeScreenModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

struct HomeScreenModel: Codable {
    let topBanners: [TopBannersModel]?
    let recentlyViewed: [RecentlyViewedModel]?
    let feturedProducts: [FeaturedProductsModel]?
    let categories: [CategoriesModel]?
}
