//
//  MainMenuViewController.swift
//  Car Game Test
//
//  Created by Daniel on 2/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit
import AVFoundation
var audioPlayer: AVAudioPlayer?
class MainMenuViewController: UIViewController {

    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var tut: UIButton!
    @IBOutlet weak var settings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic(filename: "theme.mp3")
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
        let loadedLifetime = UserDefaults.standard.integer(forKey: "lifetimePts")
        lifetimePts = loadedLifetime
        let loadedTrashNo = UserDefaults.standard.integer(forKey: "trashNo")
        trashNo = loadedTrashNo
        let loadedRecNo = UserDefaults.standard.integer(forKey: "recNo")
        recNo = loadedRecNo
        var loadedBoughtUpgrades = UserDefaults.standard.integer(forKey: "upgradesBought")
        if loadedBoughtUpgrades == 0 {
            loadedBoughtUpgrades = 3
        }
        upgradesBought = loadedBoughtUpgrades
        let loadedCorrectSwipes = UserDefaults.standard.integer(forKey: "correctSwipes")
        correctSwipes = loadedCorrectSwipes
    }
    
    func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: newURL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch let error as NSError {
            print(error.description)
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
