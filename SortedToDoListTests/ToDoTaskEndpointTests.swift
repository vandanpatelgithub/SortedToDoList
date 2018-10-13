//
//  ToDoTaskEndpointTests.swift
//  SortedToDoListTests
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import XCTest
@testable import SortedToDoList

class ToDoTaskEndpointTests: XCTestCase {

    func testToDoTaskEndpoint() {
        let endpoint = ToDoTaskAPI.toDoTasks
        XCTAssertEqual(endpoint.baseURL.absoluteString, "http://jsonplaceholder.typicode.com")
        XCTAssertEqual(endpoint.path, "/todos")
        XCTAssertEqual(endpoint.httpMethod, .get)
        XCTAssertEqual(endpoint.task, .request)
    }
}
