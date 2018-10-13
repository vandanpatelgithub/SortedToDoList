//
//  Functions.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

class HelperFunctions {
    var taskDict = [Int: [ToDoTask]]()
    var userInfos = [UserInfo]()

    func buildUserDictionary(for tasks: [ToDoTask]) {
        for task in tasks {
            if taskDict[task.userID] != nil {
                taskDict[task.userID]?.append(task)
            } else {
                taskDict[task.userID] = [task]
            }
        }
    }

    func buildUserInfoArray(forTaskDict taskDict: [Int: [ToDoTask]]) {
        for (key, value) in taskDict {
            let incompletedTasks = value.filter { $0.completed == false }
            let userInfo = UserInfo.init(id: key, incompletedToDos: incompletedTasks.count)
            userInfos.append(userInfo)
        }

        userInfos.sort (by: { (info1, info2) -> Bool in
            info1.incompletedToDos > info2.incompletedToDos
        })
    }

    func getTasks(forUserID id: Int) -> [ToDoTask] {
        return taskDict[id] ?? []
    }
}

func getJSONData(forResource resource: String, ofType type: String) -> Data? {
    guard let path = Bundle.main.path(forResource: resource, ofType: type) else { return nil }
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return data
    } catch {
        return nil
    }
}

