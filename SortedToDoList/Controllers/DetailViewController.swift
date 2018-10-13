//
//  DetailViewController.swift
//  SortedToDoList
//
//  Created by Patel, Vandan (ETW - FLEX) on 10/13/18.
//  Copyright © 2018 Patel, Vandan (ETW - FLEX). All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var userID: Int?
    var helperFunctions: HelperFunctions?
    var tasks = [ToDoTask]()
    var reuseIdentifier = "detailTaskCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        navigationItem.title = "ToDo(s) For User ID : \(userID ?? 0)"
        getTasksForUser()
    }

    // MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = "\(task.title)"
        cell.detailTextLabel?.text = task.completed ? "Complete" : "Incomplete"
        return cell
    }

    // MARK: - fileprivate methods
    fileprivate func getTasksForUser() {
        guard let id = userID else { return }
        tasks = helperFunctions?.getTasks(forUserID: id) ?? []
        tableView.reloadData()
    }
}
