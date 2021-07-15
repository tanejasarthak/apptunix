//
//  HomeScreenDataController.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

struct HomeScreenDataController: APILists, DataModelProtocol {
    let baseDataController = BaseDataController()
    
    func fetchAllData(successRes: @escaping (_ data: HomeScreenModel?,_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void) {
        baseDataController.dataRequest(url: nil, httpMethod: .get, parameters: nil, imageEndPoint: nil, authHeaders: UserDefaults.standard.value(forKey: "appToken") as? String) { data, success in
            if success {
                let temp = decode(dataDict: data, ofType: HomeScreenModel.self)
                successRes(temp, success)
            }
        } failure: { error in
            debugPrint(error?.localizedDescription)
        }
    }
    
    func fetchImages(imageEndPoint: String, successRes: @escaping (Data?, Bool) -> Void, failure: @escaping (NSError?) -> Void) {
        baseDataController.imageDataRequest(url: .fetchImage, imageEndPoint: imageEndPoint) { data in
            if (data != nil) {
                successRes(data, true)
            } else {
                successRes(nil, false)
            }
        } failure: { error in
            debugPrint(error?.localizedDescription)
        }
    }
    
}

