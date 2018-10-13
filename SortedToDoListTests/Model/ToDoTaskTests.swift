//
//  ToDoTaskTests.swift
//  SortedToDoListTests
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import XCTest
@testable import SortedToDoList

class ToDoTaskTests: XCTestCase {
    func testToDoTaskForSucceess() {
        guard let data = getJSONData(forResource: "StubbedToDoTasksResponse", ofType: "json") else {
            XCTFail("Getting JSONData Failed")
            return
        }
        do {
            let toDoTasks = try JSONDecoder().decode([ToDoTask].self, from: data)
            XCTAssertEqual(toDoTasks.count, 200)
        } catch {
            XCTFail("Decoding Failed")
        }
    }

    func testToDoTaskForEmptyResponse() {
        guard let data = getJSONData(forResource: "StubbedEmptyResponse", ofType: "json") else {
            XCTFail("Getting JSONData Failed")
            return
        }
        do {
            _ = try JSONDecoder().decode([ToDoTask].self, from: data)
            XCTFail("Decoding should not succeed")
        } catch let error {
            XCTAssertNotNil(error)
        }
    }
}
