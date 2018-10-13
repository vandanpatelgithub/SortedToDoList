//
//  ToDoTask.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

struct ToDoTask: Codable {
    let ID: Int
    let userID: Int
    let title: String
    let completed: Bool

    private enum CodingKeys: String, CodingKey {
        case ID     = "id"
        case userID = "userId"
        case title, completed
    }
}
