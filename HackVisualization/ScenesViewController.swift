//
//  ScenesViewController.swift
//  HackVisualization
//
//  Created by Claire Illich on 3/24/19.
//  Copyright © 2019 Claire Illich. All rights reserved.
//

import UIKit

class ScenesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var objectCollectionView: UICollectionView!
    @IBOutlet weak var scenesCollecitonView: UICollectionView!
    
    @IBOutlet weak var createSceneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        scenesCollecitonView.delegate = self
        scenesCollecitonView.dataSource = self
        objectCollectionView.delegate = self
        objectCollectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        createSceneButton.layer.borderColor = UIColor(red: CGFloat(27.0/255.0), green: CGFloat(157/255.0), blue: CGFloat(150/255.0), alpha: 1).cgColor
        createSceneButton.layer.borderWidth = 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.scenesCollecitonView {
            return 4
        } else {
            return 8
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        if collectionView == self.scenesCollecitonView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sceneCellIdentifier", for: indexPath)

        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "objectCellIdentifier", for: indexPath)
        }
        
        return cell
    }
    
    // MARK: UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataModel.shared.scenes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sceneTableCellIdentifier") as! GoalTableViewCell
        cell.goalNameLabel.text = "Scene " + String(describing: indexPath.row)
        cell.goalDescriptionLabel.text = DataModel.shared.scenes[indexPath.row]
        cell.selectionStyle = .none
        
        
        return cell
    }
}
