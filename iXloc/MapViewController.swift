//
//  ViewController.swift
//  iXloc
//
//  Created by ZhouYiqin on 7/4/17.
//  Copyright © 2017 Yiqin Zhou. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, AddActivityDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var annotation: MKPointAnnotation?
    var locationManager = CLLocationManager()
    var activity: Activity?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "newActivity"){
            let ActivityNavigationController = segue.destination as! UINavigationController
            let ActivityViewController = ActivityNavigationController.topViewController as! ActivityViewController
            
            ActivityViewController.delegate = self
            
        }
        
        
    }
    

   
    

    func didAddActivity(activity: Activity) {
        
        let coordinate=CLLocationCoordinate2D(latitude:activity.latitude!,longitude:activity.longitude!)
        
        let point=MKPointAnnotation()
        point.coordinate=coordinate
        point.title=activity.name
        map.addAnnotation(point)
        
   
    }
    
    func defaultName() ->String?{
        return "From Map"
    }
    
 


}

