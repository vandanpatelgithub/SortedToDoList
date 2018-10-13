//
//  ViewController.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/12/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import UIKit

class LandingViewController: UITableViewController {

    var networkManager: NetworkManager?
    var loadingVC: LoadingViewController?
    var helperFunctions: HelperFunctions?
    let reuseIdentifier = "taskCell"
    var tasks = [ToDoTask]()
    var userInfos = [UserInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let loadingVC = loadingVC { add(loadingVC) }
        networkManager?.getToDoTasks(completion: { [weak self] (toDoTasks, error) in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async { strongSelf.loadingVC?.remove() }

            if error == nil {
                strongSelf.tasks = toDoTasks ?? []
                strongSelf.helperFunctions?.buildUserDictionary(for: strongSelf.tasks)
                strongSelf.helperFunctions?.buildUserInfoArray(forTaskDict: strongSelf.helperFunctions?.taskDict ?? [:])
                strongSelf.userInfos = strongSelf.helperFunctions?.userInfos ?? []
                DispatchQueue.main.async { strongSelf.tableView.reloadData() }
            } else {
                let alert = Alert(vc: strongSelf, title: "ERROR", message: error ?? "")
                alert.showAlert()
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let userInfo = userInfos[indexPath.row]
        cell.textLabel?.text = "User ID: \(userInfo.id)"
        cell.detailTextLabel?.text = "Incompleted Tasks: \(userInfo.incompletedToDos)"
        return cell
    }
}

