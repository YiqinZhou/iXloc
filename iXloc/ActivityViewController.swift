//
//  ActivityViewController.swift
//  iXloc
//
//  Created by ZhouYiqin on 7/4/17.
//  Copyright © 2017 Yiqin Zhou. All rights reserved.
//

import UIKit
import MapKit

class ActivityViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var Save: UIBarButtonItem!
    @IBOutlet weak var Cancel: UIBarButtonItem!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var activityTableViewController: ActivityTableViewController?
    
    var delegate: AddActivityDelegate?
    
    let locationManager: CLLocationManager=CLLocationManager()
    var latestLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaultName=delegate?.defaultName()
        nameTextField.text=defaultName
        
  
        locationManager.delegate=self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        
       
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Save(_ sender: Any) {
        
        var activity: Activity?
        if let location=self.latestLocation{
            activity=Activity(name: nameTextField.text, description: descriptionTextView.text, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }else{
            activity=Activity(name: nameTextField.text, description: descriptionTextView.text)
        }
        
        
        //activityTableViewController?.addActivity(activity:activity)
        
        delegate?.didAddActivity(activity: activity!)
        
        //activityTableViewController?.tableView?.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        self.latestLocation=locations[0]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
