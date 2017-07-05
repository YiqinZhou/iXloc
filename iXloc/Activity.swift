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


class Activity{
    var name: String?
    var description: String?
    var latitude:Double?
    var longitude: Double?
    
    init(name: String?, description: String?){
        self.name=name
        self.description=description
    }
    
    init(name: String?, description: String?, latitude: Double?, longitude: Double?){
        self.name=name
        self.description=description
        self.latitude=latitude
        self.longitude=longitude
    }
    
  
}
