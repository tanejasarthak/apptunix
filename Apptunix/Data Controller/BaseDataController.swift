//
//  BaseDataController.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 14/07/21.
//

import Foundation
import Alamofire

struct BaseDataController {
    func dataRequest(method: RequestMethod, url: EndPointUrl, parameters: [String: Any]?, authHeaders: String?, success: @escaping (_ authToken: String,_ success: Bool) -> Void, failure: @escaping (_ error: AFError?) -> Void) {
        let completeURL = baseUrl + url.rawValue
        let httpHeaders: HTTPHeaders = [.authorization(authHeaders ?? "")]
        var token = ""
        var successStatus = true
        debugPrint("url=", completeURL)
        debugPrint(parameters)
        debugPrint(httpHeaders)
        
        AF.request(completeURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: httpHeaders, interceptor: nil, requestModifier: nil)
            .responseJSON { response in
                switch response.result {
                    case .success(let value):
                        debugPrint(value)
                        let val = value as? [String: Any]
                        let data = val?["data"] as? [String: Any]
                        token = data?["token"] as? String ?? ""
                        successStatus = val?["success"] as? Bool ?? true
                        success(token, successStatus)
                case .failure(let error):
                      //  debugPrint(error.localizedDescription)
                       failure(error)
                }
            }
    }
}
