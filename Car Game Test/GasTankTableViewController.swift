//
//  GasTankTableViewController.swift
//  Car Game Test
//
//  Created by Daniel on 17/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit
    var equippedGasTank = "missan"
    var haveII = false
    var haveIII = false

class GasTankTableViewController: UITableViewController {
    @IBOutlet var mainTable: UITableView!
    
    
    @IBOutlet weak var totalPtsLabel: UILabel!
    @IBOutlet weak var missanButton: UIButton!
    @IBOutlet weak var lazusButton: UIButton!
    @IBOutlet weak var texlaButton: UIButton!
    
    @IBOutlet weak var lazusDesc: UILabel!
    @IBOutlet weak var texlaDesc: UILabel!
    
    var lazusPts = 2500
    var texlaPts = 7500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPtsLabel.text = "Points:\(totalPts)"
        mainTable.allowsSelection = false
        checkForEquipped()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    
    func checkForEquipped() {
        
        // IF ELSE FOR TOTALPTS CAR BUTTON SHOWINGSGINGS
        if totalPts < lazusPts {
            lazusButton.backgroundColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
            lazusButton.setTitle("NOT ENOUGH", for: .normal)
        }
        if totalPts < texlaPts {
            texlaButton.backgroundColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
            texlaButton.setTitle("NOT ENOUGH", for: .normal)
        }
        
        
        // SWITCH FOR EQUIPPED CAR BUTTON SHOWINGSGINGS
        switch equippedGasTank {
        case "missan":
            // MAIN
            missanButton.backgroundColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
            missanButton.setTitle("CHOSEN", for: .normal)
            
            // OTHERS
            // LAZUS
            if haveII == true {
                lazusButton.backgroundColor = UIColor(red:0.36, green:0.70, blue:1.00, alpha:1.0)
                lazusButton.setTitle("EQUIP", for: .normal)
            }
            // TEXLA
            if haveIII == true {
                texlaButton.backgroundColor = UIColor(red:0.36, green:0.70, blue:1.00, alpha:1.0)
                texlaButton.setTitle("EQUIP", for: .normal)
            }
            mainTable.reloadData()
        case "lazus":
            // MAIN
            lazusButton.backgroundColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
            lazusButton.setTitle("CHOSEN", for: .normal)
            
            // OTHERS - MISSAN
            missanButton.backgroundColor = UIColor(red:0.36, green:0.70, blue:1.00, alpha:1.0)
            missanButton.setTitle("EQUIP", for: .normal)
            
            // TEXLA
            if haveIII == true {
                texlaButton.backgroundColor = UIColor(red:0.36, green:0.70, blue:1.00, alpha:1.0)
                texlaButton.setTitle("EQUIP", for: .normal)
            }
            mainTable.reloadData()
        case "texla":
            // MAIN
            texlaButton.backgroundColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)
            texlaButton.setTitle("CHOSEN", for: .normal)
            
            // OTHERS - MISSAN
            missanButton.backgroundColor = UIColor(red:0.36, green:0.70, blue:1.00, alpha:1.0)
            missanButton.setTitle("EQUIP", for: .normal)
            
            // LAZUS
            if haveII == true {
                lazusButton.backgroundColor = UIColor(red:0.36, green:0.70, blue:1.00, alpha:1.0)
                lazusButton.setTitle("EQUIP", for: .normal)
                
            }
            mainTable.reloadData()
        default:
            print("Somethin's wrong with the cars, sir.")
        }
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
    @IBAction func buyMissan(_ sender: Any) {
        equippedGasTank = "missan"
        UserDefaults.standard.set(equippedGasTank, forKey: "equippedGasTank")

        checkForEquipped()
    }
    
    @IBAction func buyLazus(_ sender: Any) {
        if totalPts >= lazusPts {
            if haveII == false {
                totalPts -= lazusPts
                UserDefaults.standard.set(totalPts, forKey: "totalPts")
            }
            equippedGasTank = "lazus"
            UserDefaults.standard.set(equippedGasTank, forKey: "equippedGasTank")

            haveII = true
            UserDefaults.standard.set(haveII, forKey: "haveII")
            lazusDesc.text = "OWNED"
            totalPtsLabel.text = "Points:\(totalPts)"
            checkForEquipped()
        }
    }
    
    @IBAction func buyTexla(_ sender: Any) {
        if totalPts >= texlaPts {
            if haveIII == false {
                totalPts -= texlaPts
                UserDefaults.standard.set(totalPts, forKey: "totalPts")
            }
            equippedGasTank = "texla"
            UserDefaults.standard.set(equippedGasTank, forKey: "equippedGasTank")

            haveIII = true
            UserDefaults.standard.set(haveIII, forKey: "haveIII")
            texlaDesc.text = "OWNED"
            totalPtsLabel.text = "Points:\(totalPts)"
            checkForEquipped()
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
