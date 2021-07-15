//
//  HomeScreenViewModel.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

class HomeScreenViewModel {
    var topBannersVM: [TopBannersViewModel]?
    var recentlyViewedVM: [RecentlyViewedViewModel]?
    var featuredProductsVM: [FeaturedProductsViewModel]?
}

// MARK: - API Call
extension HomeScreenViewModel {
    func fetchHomeData(with API: APILists, successResponse: @escaping (_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        API.fetchAllData { data, success in
            
            if let topBanners = data?.topBanners {
                self.topBannersVM = topBanners.map {
                     TopBannersViewModel(topBannersModel: $0)
                }
            }
            
            if let recentlyViewed = data?.recentlyViewed {
                self.recentlyViewedVM = recentlyViewed.map {
                     RecentlyViewedViewModel(recentlyViewedModel: $0)
                }
            }
            
            if let featuredProducts = data?.feturedProducts {
                self.featuredProductsVM = featuredProducts.map {
                     FeaturedProductsViewModel(featuredProductsModel: $0)
                }
            }
            
            successResponse(success)
            
        } failure: { error in
            
        }
    }
    
    func fetchImage(with API: APILists, imageEndPoint: [TopBannersViewModel], successResponse: @escaping (_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        
        for record in imageEndPoint {
            API.fetchImages(imageEndPoint: record.image) { data, error in
                record.imageData = data
                successResponse(true)
            } failure: { error in
                successResponse(false)
            }
        }

    }
}


/*
 RecentlyViewedViewModel(recentlyViewedModel: data?.recentlyViewed)
 FeaturedProductsViewModel(featuredProductsModel: data?.feturedProducts)
 */



