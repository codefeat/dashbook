//
//  CompleteDashViewController.swift
//  DashBook1.1
//
//  Created by Lowell Fortune on 12/23/18.
//  Copyright © 2018 SpotBerry. All rights reserved.
//

import UIKit

class CompleteDashViewController: UIViewController {

    var previousVC = DashBookTableViewController();
    
    var selectedDash : DashCoreData?;
    
    @IBOutlet weak var dashCompleteLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       dashCompleteLbl.text = selectedDash?.name
    }
    

    @IBAction func dashCompleteBtn(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let theDash = selectedDash {
                context.delete(theDash)
                navigationController?.popViewController(animated: true);
            }
            
        }
        
        /*
        var index = 0
        for dash in previousVC.dashes {
            if dash.name == selectedDash.name {
                //print("We found it! \(dash.name)");
                previousVC.dashes.remove(at: index);
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true);
                break;
            }
            index += 1
        } */
    }
    

}
