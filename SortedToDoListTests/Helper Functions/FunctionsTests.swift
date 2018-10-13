//
//  FunctionsTests.swift
//  SortedToDoListTests
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/13/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import XCTest
@testable import SortedToDoList

class FunctionsTests: XCTestCase {

    let task1 = ToDoTask(ID: 1, userID: 1, title: "Go Running", completed: false)
    let task2 = ToDoTask(ID: 2, userID: 1, title: "Do Coding Exercise", completed: true)
    let task3 = ToDoTask(ID: 3, userID: 1, title: "Go To Farmer's Market", completed: false)
    let task4 = ToDoTask(ID: 4, userID: 2, title: "Go Running", completed: false)
    let task5 = ToDoTask(ID: 5, userID: 2, title: "Do Coding Exercise", completed: false)
    let task6 = ToDoTask(ID: 6, userID: 2, title: "Go To Farmer's Market", completed: false)



    func testBuildUserDictionary() {
        let helperFunctions = HelperFunctions()
        helperFunctions.buildUserDictionary(for: [task1, task2, task3])
        XCTAssertEqual(helperFunctions.taskDict.count, 1)
        XCTAssertEqual(helperFunctions.taskDict[1]?.count, 3)
    }

    func testBuildUserInfoArray() {
        let helperFunctions = HelperFunctions()
        helperFunctions.buildUserDictionary(for: [task1, task2, task3, task4, task5, task6])
        helperFunctions.buildUserInfoArray(forTaskDict: helperFunctions.taskDict)
        XCTAssertEqual(helperFunctions.userInfos.count, 2)
        XCTAssertEqual(helperFunctions.userInfos.first?.id, 2)
        XCTAssertEqual(helperFunctions.userInfos.last?.id, 1)
        XCTAssertEqual(helperFunctions.userInfos.first?.incompletedToDos, 3)
        XCTAssertEqual(helperFunctions.userInfos.last?.incompletedToDos, 2)
    }

    func testGetTasksForUserID() {
        let helperFunctions = HelperFunctions()
        helperFunctions.buildUserDictionary(for: [task1, task2, task3, task4, task5, task6])
        let tasks = helperFunctions.getTasks(forUserID: 1)
        XCTAssertEqual(tasks.count, 3)
    }
}
