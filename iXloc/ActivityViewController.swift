//
//  ActivityViewController.swift
//  iXloc
//
//  Created by ZhouYiqin on 7/4/17.
//  Copyright © 2017 Yiqin Zhou. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var Save: UIBarButtonItem!
    @IBOutlet weak var Cancel: UIBarButtonItem!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    var activityTableViewController: ActivityTableViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Save(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        let activity=Activity(name:nameTextField.text, description:descriptionTextView.text)
        activityTableViewController?.activities.append(activity)
        activityTableViewController?.tableView?.reloadData()
    }
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

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
