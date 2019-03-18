//
//  MinigameViewController.swift
//  Car Game Test
//
//  Created by Daniel on 17/3/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class MinigameViewController: UIViewController {
    
    var ptsEarned = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func fuelButton(_ sender: Any) {
        fuel = 10
    }
    @IBAction func ptsButton(_ sender: Any) {
        ptsEarned = 1000
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwind" {
            let destination = segue.destination as! ViewController
            destination.pts += ptsEarned
        }
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
}
