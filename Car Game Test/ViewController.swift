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
    var secTimer = Timer()
    
    @IBOutlet weak var trash1: UIImageView!
    @IBOutlet weak var trash2: UIImageView!
    @IBOutlet weak var car: UIImageView!
    
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
        let leftSwipe1 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(swipe:)))
        leftSwipe1.direction = UISwipeGestureRecognizer.Direction.left
        let leftSwipe2 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(swipe:)))
        leftSwipe2.direction = UISwipeGestureRecognizer.Direction.left
        self.trash1.addGestureRecognizer(leftSwipe1)
        self.trash2.addGestureRecognizer(leftSwipe2)
        
        gifView.loadGif(name: "movingroad")
        
        fuel = 5
        pts = 0
        time = 0
        
        self.trash1.isHidden = true
        self.trash2.isHidden = true
        self.trash1.frame.origin.y = 203.0
        self.trash2.frame.origin.y = 203.0
        
        self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
        
        // MAIN TIMER GAME - IMPORTANT
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            self.time += 1
            print(self.time)
            if self.time % 5 == 0 {
                self.pts += 50
                self.fuel -= 1
                self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
            }
            
            
            // TRASH MOVES DOWN + COLLISION WITH CAR
            if self.time % 2 == 0 {
                self.trash1.isHidden = false
                self.trash2.isHidden = false
                self.secTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {(_) in
                    self.trash1.frame.origin.y += 1
                    self.trash2.frame.origin.y += 1
                    if (self.trash1.frame.intersects(self.car.frame)) || (self.trash2.frame.intersects(self.car.frame)){
                        self.stopGame()
                        self.trash1.isHidden = true
                        self.trash2.isHidden = true
                        self.trash1.frame.origin.y = 203.0
                        self.trash2.frame.origin.y = 203.0
                    }
                })
            }
            
            // FUEL RUNS OUT
            if self.fuel == 0 {
                self.stopGame()
            }
        })
        
        // END OF TIMER
        
    }
    
    func stopGame() {
        gifView.image = UIImage(named: "stoproad")
        secTimer.invalidate()
        timer.invalidate()
    }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 2:
            statsLabel.text = "BOOYAH"
        default:
            break
        }
    }
}

