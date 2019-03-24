//
//  File.swift
//  HackVisualization
//
//  Created by Claire Illich on 3/23/19.
//  Copyright © 2019 Claire Illich. All rights reserved.
//

import Foundation
import UIKit

public struct FearData: Codable {
    var name: String = ""
    var image: UIImage = UIImage()
    var description: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image = "image"
        case description = "description"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        let imageData = try values.decode(Data.self, forKey: .image)
        
        if let img = UIImage(data: imageData) {
            self.image = img
        } else {
            self.image = UIImage()
        }
        
        self.description = try values.decode(String.self, forKey: .description)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        
        if let imageData = self.image.pngData() {
            try container.encode(imageData, forKey: .image)
        }
        
    }
    

}

public struct GoalData: Codable {
    var name: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
    }
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.description = try values.decode(String.self, forKey: .description)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
    }
}

public struct ImageData: Codable {
    var name: String
    var image: UIImage
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image = "image"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        let imageData = try values.decode(Data.self, forKey: .image)
        
        if let img = UIImage(data: imageData) {
            self.image = img
        } else {
            self.image = UIImage()
        }
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        
        if let imageData = self.image.pngData() {
            try container.encode(imageData, forKey: .image)
        }
        
    }
}

public enum Feeling: String, Codable {
    case happy
    case neutral
    case sad
}


public class DataModel: NSObject, Codable {
    
    // Model
    public var fears: [FearData] = []
    public var goals: [GoalData] = []
    public var scenes: [String] = []
    public var placedObjects: [ImageData] = []
    public var feelings: [Feeling] = []
    
    // Singleton
    static let shared = DataModel()
    
    private override init() {
        
    }
    
    public func updateDataModel(dm: DataModel) {
        self.fears = dm.fears
        self.goals = dm.goals
        self.scenes = dm.scenes
        self.placedObjects = dm.placedObjects
        self.feelings = dm.feelings
    }
    
    public func addFeeling(feel: Feeling) {
        self.feelings.append(feel)
    }
    
}
