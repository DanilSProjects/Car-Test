//
//  MainMenuViewController.swift
//  Car Game Test
//
//  Created by Daniel on 2/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var tut: UIButton!
    @IBOutlet weak var settings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        play.layer.cornerRadius = 5
        tut.layer.cornerRadius = 5
        settings.layer.cornerRadius = 5
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
