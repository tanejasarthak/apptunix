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
    var categoriesVM: [CategoriesViewModel]?
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
            
            if let categories = data?.categories {
                self.categoriesVM = categories.map {
                    CategoriesViewModel(categoriesModel: $0)
                }
            }
            
            successResponse(success)
            
        } failure: { error in
            
        }
    }
    
    func fetchImage(with API: APILists, successResponse: @escaping (_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        guard let topBannersVM = self.topBannersVM else { return }
        
        for record in topBannersVM {
            API.fetchImages(imageEndPoint: record.image) { data, error in
                record.imageData = data
                successResponse(true)
            } failure: { error in
                successResponse(false)
            }
        }
    }
    
    func fetchImageForFeatured(with API: APILists, successResponse: @escaping (_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        guard let featuredVM = self.featuredProductsVM else { return }
        
        for record in featuredVM {
            API.fetchImages(imageEndPoint: record.image) { data, error in
                record.imageData = data
                successResponse(true)
            } failure: { error in
                successResponse(false)
            }
        }
    }
    
    func fetchImageForCategories(with API: APILists, successResponse: @escaping (_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        guard let categoryVM = self.categoriesVM else { return }
        
        for record in categoryVM {
            API.fetchImages(imageEndPoint: record.image) { data, error in
                record.imageData = data
              //  record.imageData = data
                successResponse(true)
            } failure: { error in
                successResponse(false)
            }
        }
        
        for record in categoryVM {
            for subCatArr in record.subCategoriesArr {
                API.fetchImages(imageEndPoint: subCatArr.image ?? "") { data, error in
                    record.subCategoryImageData.append(data ?? Data())
                  //  record.imageData = data
                    successResponse(true)
                } failure: { error in
                    successResponse(false)
                }
            }
        }
    }

}

