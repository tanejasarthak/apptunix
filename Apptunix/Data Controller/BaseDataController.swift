//
//  BaseDataController.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 14/07/21.
//

import Foundation
import Alamofire

struct BaseDataController {
    func dataRequest(url: EndPointUrl?, httpMethod: HTTPMethod , parameters: [String: Any]?, imageEndPoint: String?, authHeaders: String?, success: @escaping (_ data: [String: Any]?,_ success: Bool) -> Void, failure: @escaping (_ error: AFError?) -> Void) {
        let completeURL = baseUrl + (url?.rawValue ?? "")
        
        let httpHeaders: HTTPHeaders = [.authorization(authHeaders ?? "")]
        var successStatus = true
        debugPrint("url=", completeURL)
        debugPrint(parameters)
        debugPrint(httpHeaders)
        
        AF.request(completeURL, method: httpMethod, parameters: httpMethod == .post ? parameters : nil, encoding: JSONEncoding.default, headers: httpHeaders, interceptor: nil, requestModifier: nil)
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        debugPrint(value)
                        let val = value as? [String: Any]
                        let data = val?["data"] as? [String: Any]
                        successStatus = val?["success"] as? Bool ?? true
                        success(data, successStatus)
                case .failure(let error):
                      //  debugPrint(error.localizedDescription)
                       failure(error)
                }
            }
    }
    
    func imageDataRequest(url: EndPointUrl?, imageEndPoint: String, success: @escaping (_ data: Data?) -> Void, failure: @escaping (_ error: AFError?) -> Void) {
        let completeURL = baseUrl + (url?.rawValue ?? "") + imageEndPoint
        debugPrint(completeURL)
        AF.request(completeURL).response { response in
            switch response.result {
                case .success(let value):
                    success(value)
                case .failure(let error):
                    debugPrint(error)
            }
        }
    }
}
