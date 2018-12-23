//
//  AddDashViewController.swift
//  DashBook1.1
//
//  Created by Lowell Fortune on 12/23/18.
//  Copyright © 2018 SpotBerry. All rights reserved.
//

import UIKit

class AddDashViewController: UIViewController {
    var previousVC = DashBookTableViewController()
    
    
    @IBOutlet weak var dashText: UITextField!
    
    @IBOutlet weak var rockSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addDashBtn(_ sender: UIButton) {
 /*
        let dash = Dash();
        dash.name = dashText.text!
        dash.rock = rockSwitch.isOn
        
        previousVC.dashes.append(dash);
        previousVC.tableView.reloadData();
        
        navigationController?.popViewController(animated: true)
      */
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let dash = DashCoreData(entity: DashCoreData.entity(), insertInto: context)
            
            if let dashText = dashText.text {
                dash.name = dashText
                dash.rock = rockSwitch.isOn
            }
           
            try? context.save();
            navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    

}
