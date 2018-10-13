//
//  NetworkManager.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

struct NetworkManager {
    private let router = Router<ToDoTaskAPI>()

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }

    func getToDoTasks() {
        
    }
}

enum NetworkResponse: String {
    case success
    case authenticationError        = "You need to be authenticated first"
    case badRequest                 = "Bad Request"
    case outdated                   = "The URL you requested is outdated"
    case failed                     = "Network request failed"
    case noData                     = "Response returned with no data to decode"
    case unableToDecode             = "We could not decode the resopnse"
    case unableToCaptureFeed        = "We could not conver set to array"
}

enum Result<String> {
    case success
    case failure(String)
}
