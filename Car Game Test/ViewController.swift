//
//  ViewController.swift
//  Car Game Test
//
//  Created by Daniel on 10/3/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var statsLabel: UILabel!
    
    var fuel = 5
    var pts = 0
    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statsLabel.text = "POINTS: \(pts) FUEL: \(fuel)L"
        moveCar()
    }


    @IBAction func startButton(_ sender: Any) {
        moveCar()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        stopGame()
    }
    
    func moveCar() {
        gifView.loadGif(name: "movingroad")
        
        fuel = 5
        pts = 0
        time = 0
        self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            self.time += 1
            print(self.time)
            if self.time % 5 == 0 {
                self.pts += 50
                self.fuel -= 1
                self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
            }
            
            if self.fuel == 0 {
                self.stopGame()
            }
        })
        
    }
    
    func stopGame() {
        gifView.image = UIImage(named: "stoproad")
        timer.invalidate()
    }
}

