//
//  Errors.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    case parameterNil   = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL     = "URL is nil"
}
