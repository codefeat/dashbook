//
//  DashBookTableViewController.swift
//  DashBook1.1
//
//  Created by Lowell Fortune on 12/23/18.
//  Copyright © 2018 SpotBerry. All rights reserved.
//

import UIKit

class DashBookTableViewController: UITableViewController {
    
    var dashes : [Dash] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dashes = createDashes();
    }

    // MARK: - Table view data source

    func createDashes() -> [Dash] {
        let time = Dash()
        time.name = "Schedule Time of THERM";
        time.rock = true
        
        let health = Dash()
        health.name = "list Health of THERM";
        
        let education = Dash()
        education.name = "Read 1 hour";
        education.rock = true;
        
        let relationships = Dash()
        relationships.name = "Call Jaalam";
        relationships.rock = true;
        
        let money = Dash();
        money.name = "Work on books and gear"
        money.rock = false;
        
        
        return [time, health, education, relationships, money]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dashes.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashCell", for: indexPath)

        // Configure the cell...
        let dash = dashes[indexPath.row];
        
        if dash.rock {
            cell.textLabel?.text = "❗️" +  dash.name;
        }else{
            cell.textLabel?.text = "💧" + dash.name;
        }
        
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dash = dashes[indexPath.row];
        performSegue(withIdentifier: "goToComplete", sender: dash)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddDashViewController {
            addVC.previousVC = self;
        }
        
        if let completeVC = segue.destination as? CompleteDashViewController {
            
            if let dash = sender as? Dash {
                completeVC.selectedDash = dash
                completeVC.previousVC = self;
            }
            
        }
        
    }
    
}
