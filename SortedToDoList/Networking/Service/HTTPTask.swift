//
//  HTTPTask.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

public enum HTTPTask: Equatable {
    public static func == (lhs: HTTPTask, rhs: HTTPTask) -> Bool {
        switch (lhs, rhs) {
        case (.request, .request):
            return true
        }
    }
    
    case request
}
