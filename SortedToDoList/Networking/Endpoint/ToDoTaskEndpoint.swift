//
//  ToDoTaskEndpoint.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

public enum ToDoTaskAPI {
    case toDoTasks
}

extension ToDoTaskAPI: EndPointType {
    var baseURL: URL {
        switch self {
        case .toDoTasks:
            guard let url = URL(string: "http://jsonplaceholder.typicode.com") else {
                fatalError("Base URL couldn't be configured")
            }
            return url
        }
    }

    var path: String {
        switch self {
        case .toDoTasks:
            return "/todos"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .toDoTasks:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        case .toDoTasks:
            return .request
        }
    }
}
