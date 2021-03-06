//
//  ActivityViewController.swift
//  iXloc
//
//  Created by ZhouYiqin on 7/4/17.
//  Copyright © 2017 Yiqin Zhou. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import RealmSwift

class ActivityViewController: UIViewController,CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var Save: UIBarButtonItem!
    @IBOutlet weak var Cancel: UIBarButtonItem!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var selectImageButton: UIImageView!
    
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
    
    @IBAction func SelectImage(_ sender: Any) {
        
        // Image Picker
        
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image")
        }
        self.selectedImage.image=selectedImage
        self.selectImageButton.isHidden=true
        
        dismiss(animated: true, completion: nil)
    }
    
   

    @IBAction func Save(_ sender: Any) {
        
        
        let activityModel = ActivityModel()
        activityModel.name = nameTextField.text!
        activityModel.descrp = descriptionTextView.text!
        
        
        
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        try! realm.write {
            realm.add(activityModel)
        }
        
        print (realm.configuration.fileURL)
        
        var activity: Activity?
        
        if let location=self.latestLocation{
            activity=Activity(name: nameTextField.text, description: descriptionTextView.text, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }else{
            activity=Activity(name: nameTextField.text, description: descriptionTextView.text)
        }
        
        Alamofire.request("https://ixloc-43376.firebaseio.com/activities.json", method: .post, parameters: activity?.toJSON(), encoding: JSONEncoding.default).responseJSON(completionHandler: {
            response in
            
            switch response.result{
            case.success:
                self.delegate?.didAddActivity(activity: activity!)
                self.dismiss(animated:true, completion: nil)
                break
            case.failure:
                break
            }
        })
        
        if let image=self.selectedImage.image{
            activity?.image=image
        }
 
 
      
        
        
        
        //activityTableViewController?.addActivity(activity:activity)
        
        //delegate?.didAddActivity(activity: activity!)
        
        //activityTableViewController?.tableView?.reloadData()
        //self.dismiss(animated: true, completion: nil)
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
