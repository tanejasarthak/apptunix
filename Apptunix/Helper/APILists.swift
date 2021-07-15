//
//  APILists.swift
//  Apptunix
//
//  Created by Sarthak Taneja on 15/07/21.
//

import Foundation

protocol APILists {
    func fetchAllData(successRes: @escaping (_ data: HomeScreenModel?,_ success: Bool) -> Void, failure: @escaping (_ error: NSError?) -> Void)
}
