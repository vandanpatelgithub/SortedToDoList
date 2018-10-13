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
    let reuseIdentifier = "taskCell"
    var tasks = [ToDoTask]()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager?.getToDoTasks(completion: { [weak self] (toDoTasks, error) in
            guard
                let strongSelf = self,
                let tasks = toDoTasks else { return }
            if error == nil {
                strongSelf.tasks = tasks
                DispatchQueue.main.async { strongSelf.tableView.reloadData() }
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) : \(tasks[indexPath.row].title)"
        return cell
    }
}

