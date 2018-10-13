//
//  Alert.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import UIKit

struct Alert {
    let vc: UIViewController
    let title: String
    let message: String

    init(vc: UIViewController, title: String, message: String) {
        self.vc        = vc
        self.title     = title
        self.message   = message
    }

    func showAlert() {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.present(alert, animated: true)
    }
}
