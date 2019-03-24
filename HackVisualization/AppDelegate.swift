//
//  AppDelegate.swift
//  HackVisualization
//
//  Created by Claire Illich on 3/23/19.
//  Copyright © 2019 Claire Illich. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Model
    let dataModelKey = "DataModelKey"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let defaults = UserDefaults.standard
        
        // Get data model from user defaults if it exists
        if let dataModel = defaults.object(forKey: dataModelKey) as? Data {
            let decoder = JSONDecoder()
            
            if let saved = try? decoder.decode(DataModel.self, from: dataModel) {
                DataModel.shared.updateDataModel(dm: saved)
            }
        }
        
        DataModel.shared.goals = []
        let goal1 = GoalData(name: "Overcoming Aquaphobia", description: "I'm really afraid of the water")
        DataModel.shared.goals.append(goal1)
        let goal2 = GoalData(name: "Be Nice to Grandma", description: "Call her every week")
        DataModel.shared.goals.append(goal2)
        let goal3 = GoalData(name: "Running in the Woods", description: "Overcome fear of nature")
        DataModel.shared.goals.append(goal3)
        let goal4 = GoalData(name: "Public Speaking", description: "Talking in front of large crowds")
        DataModel.shared.goals.append(goal4)
        DataModel.shared.scenes = []
        DataModel.shared.scenes.append("Forest in North Dakota")
        DataModel.shared.scenes.append("Grandma's House at Christmas")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Put data model into user defaults
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(DataModel.shared) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: dataModelKey)
        }
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

