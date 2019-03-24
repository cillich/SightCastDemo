//
//  DashboardViewController.swift
//  HackVisualization
//
//  Created by Claire Illich on 3/23/19.
//  Copyright © 2019 Claire Illich. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    
    // View
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var recordSceneButton: UIButton!
    @IBOutlet weak var journalButton: UIButton!
    @IBOutlet weak var scenesButton: UIButton!
    @IBOutlet weak var goalsButton: UIButton!
    @IBOutlet weak var vrButton: UIButton!
    @IBOutlet weak var goalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let navigationBar = self.navigationController!.navigationBar
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
    
        
        goalCollectionView.delegate = self
        goalCollectionView.dataSource = self
        goalCollectionView.backgroundColor = .clear
        goalCollectionView.isScrollEnabled = true
        
        recordSceneButton.layer.borderColor = UIColor(red: CGFloat(27.0/255.0), green: CGFloat(157/255.0), blue: CGFloat(150/255.0), alpha: 1).cgColor
        recordSceneButton.layer.borderWidth = 3
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        goalCollectionView.reloadData()
    }

    // MARK: CollectionViewDataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "goalCellIdentifier", for: indexPath) as! GoalCollectionViewCell
        
        cell.goalLabel.text = DataModel.shared.goals[indexPath.row].name
        
        return cell
    }
    
    
    // MARK: Feeling Action Buttons

    @IBAction func happyPressed(_ sender: Any) {
        DataModel.shared.addFeeling(feel: .happy)
    }
    
    @IBAction func neutralPressed(_ sender: Any) {
        DataModel.shared.addFeeling(feel: .neutral)
    }
    
    @IBAction func sadPressed(_ sender: Any) {
        DataModel.shared.addFeeling(feel: .sad)
    }
    // MARK: Other Action Buttons
    
    @IBAction func recordPressed(_ sender: Any) {
        let imagePicker: UIImagePickerController = UIImagePickerController.init()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.allowsEditing = false
        imagePicker.cameraCaptureMode = .photo
        imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func journalPressed(_ sender: Any) {
    }
    
    @IBAction func scenesPressed(_ sender: Any) {
        
    }
    @IBAction func goalsPressed(_ sender: Any) {
    }
    
    @IBAction func vrPressed(_ sender: Any) {
    }
    
    // MARK: Helper Functions
    
}

