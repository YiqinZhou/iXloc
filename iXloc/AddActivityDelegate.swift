//
//  AddActivityDelegate.swift
//  iXloc
//
//  Created by ZhouYiqin on 7/5/17.
//  Copyright © 2017 Yiqin Zhou. All rights reserved.
//

import Foundation

protocol AddActivityDelegate{
    func didAddActivity(activity:Activity)
    func defaultName()->String?
  
    
}
