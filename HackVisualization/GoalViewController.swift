//
//  GoalViewController.swift
//  HackVisualization
//
//  Created by Claire Illich on 3/24/19.
//  Copyright © 2019 Claire Illich. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.shared.goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goalTableCellIdentifier") as! GoalTableViewCell
        cell.goalNameLabel.text = DataModel.shared.goals[indexPath.row].name
        cell.goalDescriptionLabel.text = DataModel.shared.goals[indexPath.row].description
        cell.selectionStyle = .none
        
        
        return cell
    }

    

}
