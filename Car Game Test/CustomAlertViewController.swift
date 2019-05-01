//
//  CustomAlertViewController.swift
//  Car Game Test
//
//  Created by Daniel on 8/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var set: UIButton!
    @IBOutlet weak var up: UIButton!
    @IBOutlet weak var play: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.layer.cornerRadius = 5
        play.layer.cornerRadius = 5
        up.layer.cornerRadius = 5
        set.layer.cornerRadius = 5
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

    @IBAction func pPress(_ sender: Any) {
        performSegue(withIdentifier: "playFromAlert", sender: nil)
    }
    @IBAction func uPress(_ sender: Any) {
        performSegue(withIdentifier: "upgradeFromAlert", sender: nil)
        audioPlayer?.play()
    }
    @IBAction func sPress(_ sender: Any) {
        performSegue(withIdentifier: "settingsFromAlert", sender: nil)
        audioPlayer?.play()
    }
}
