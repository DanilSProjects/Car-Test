//
//  SettingsTableViewController.swift
//  Car Game Test
//
//  Created by Daniel on 2/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = 5
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 11
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            // Reset progress
            totalPts = 0
            haveLazus = false
            haveTexla = false
            haveII = false
            haveIII = false
            haveTurbo = false
            haveHybrid = false
            equippedCar = "missan"
            equippedGasTank = "missan"
            equippedEngine = "equinox"
            
            UserDefaults.standard.set(totalPts, forKey: "totalPts")
            UserDefaults.standard.set(equippedCar, forKey: "equippedCar")
            UserDefaults.standard.set(equippedGasTank, forKey: "equippedGasTank")
            UserDefaults.standard.set(equippedEngine, forKey: "equippedEngine")
            UserDefaults.standard.set(haveLazus, forKey: "haveLazus")
            UserDefaults.standard.set(haveTexla, forKey: "haveTexla")
            UserDefaults.standard.set(haveII, forKey: "haveII")
            UserDefaults.standard.set(haveIII, forKey: "haveIII")
            UserDefaults.standard.set(haveTurbo, forKey: "haveTurbo")
            UserDefaults.standard.set(haveHybrid, forKey: "haveHybrid")
            
        case 3:
            performSegue(withIdentifier: "music", sender: nil)
        case 5:
            performSegue(withIdentifier: "stats", sender: nil)
        case 7:
            performSegue(withIdentifier: "useful", sender: nil)
        case 9:
            performSegue(withIdentifier: "about", sender: nil)
            
        default:
            print ("Something has gone wrong in settings, sir.")
        }
    }
    @IBAction func backPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
