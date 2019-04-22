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
        
        // Loading of Items
        let loadedPoints = UserDefaults.standard.integer(forKey: "totalPts")
        totalPts = loadedPoints
        let loadedCar = UserDefaults.standard.string(forKey: "equippedCar")
        equippedCar = loadedCar ?? "missan"
        let loadedGasTank = UserDefaults.standard.string(forKey: "equippedGasTank")
        equippedGasTank = loadedGasTank ?? "missan"
        let loadedEngine = UserDefaults.standard.string(forKey: "equippedEngine")
        equippedEngine = loadedEngine ?? "equinox"
        let loadedLazus = UserDefaults.standard.bool(forKey: "haveLazus")
        haveLazus = loadedLazus
        let loadedTexla = UserDefaults.standard.bool(forKey: "haveTexla")
        haveTexla = loadedTexla
        let loadedII = UserDefaults.standard.bool(forKey: "haveII")
        haveII = loadedII
        let loadedIII = UserDefaults.standard.bool(forKey: "haveIII")
        haveIII = loadedIII
        let loadedTurbo = UserDefaults.standard.bool(forKey: "haveTurbo")
        haveTurbo = loadedTurbo
        let loadedHybrid = UserDefaults.standard.bool(forKey: "haveHybrid")
        haveHybrid = loadedHybrid
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
