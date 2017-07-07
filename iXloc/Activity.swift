//
//  Activity.swift
//  iXloc
//
//  Created by ZhouYiqin on 7/4/17.
//  Copyright © 2017 Yiqin Zhou. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Gloss


class Activity: Glossy, Decodable{
    var name: String?
    var description: String?
    var latitude:Double?
    var longitude: Double?
    var image: UIImage?
    var imageUrl: String?
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.latitude = "latitude" <~~ json
        self.longitude = "longitude" <~~ json
        self.image = "image" <~~ json
       
    }
    
    init(name: String?, description: String?){
        self.name=name
        self.description=description
    }
    
    init(dictionary:[String: AnyObject]){
        self.name = dictionary["name"] as? String
        self.description = dictionary["description"] as? String
        self.latitude = dictionary["latitude"] as? Double
        self.longitude = dictionary["longitude"] as? Double
        self.imageUrl = dictionary["imageUrl"] as? String
    }
    
    init(name: String?, description: String?, latitude: Double?, longitude: Double?){
        self.name=name
        self.description=description
        self.latitude=latitude
        self.longitude=longitude
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "description" ~~> self.description,
            "latitude" ~~> self.latitude,
            "longitude" ~~> self.longitude
        ])
    }
    
  
}
