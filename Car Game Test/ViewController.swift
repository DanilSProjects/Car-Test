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
    var secTimer2 = Timer()
    
    var leftSwipe1 = UISwipeGestureRecognizer()
    var leftSwipe2 = UISwipeGestureRecognizer()
    var rightSwipe1 = UISwipeGestureRecognizer()
    var rightSwipe2 = UISwipeGestureRecognizer()
    
    var images = ["cardboard", "tissue", "bag", "battery"]
    
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
        
        // LEFT SWIPE
        leftSwipe1 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(swipe:)))
        leftSwipe1.direction = UISwipeGestureRecognizer.Direction.left
        leftSwipe2 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction2(swipe:)))
        leftSwipe2.direction = UISwipeGestureRecognizer.Direction.left
        self.trash1.addGestureRecognizer(leftSwipe1)
        self.trash2.addGestureRecognizer(leftSwipe2)
        
        
        // RIGHT SWIPE
        rightSwipe1 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction3(swipe:)))
        rightSwipe1.direction = UISwipeGestureRecognizer.Direction.right
        rightSwipe2 = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction4(swipe:)))
        rightSwipe2.direction = UISwipeGestureRecognizer.Direction.right
        self.trash1.addGestureRecognizer(rightSwipe1)
        self.trash2.addGestureRecognizer(rightSwipe2)
        
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
                
                self.trash1.image = UIImage(named: self.images[Int.random(in:0 ... 3)])
                self.trash2.image = UIImage(named: self.images[Int.random(in:0 ... 3)])
                
                self.trash1.isHidden = false
                self.trash2.isHidden = false
                self.secTimer = Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true, block: {(_) in
                    self.trash1.frame.origin.y += 1
                    if (self.trash1.frame.intersects(self.car.frame)){
                        self.stopGame()
                        self.trash1.isHidden = true
                        self.trash1.frame.origin.y = 203.0
                    }
                })
                
                self.secTimer2 = Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true, block: {(_) in
                    self.trash2.frame.origin.y += 1
                    if (self.trash2.frame.intersects(self.car.frame)){
                        self.stopGame()
                        self.trash2.isHidden = true
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
        secTimer2.invalidate()
        timer.invalidate()
        
        trash1.removeGestureRecognizer(leftSwipe1)
        trash1.removeGestureRecognizer(rightSwipe1)
        trash2.removeGestureRecognizer(leftSwipe2)
        trash2.removeGestureRecognizer(rightSwipe2)
    }
    
    // LEFT SWIPES
    // TRASH 1
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 2:
            // Left
            let trash1Current = trash1.image!.pngData()

            if trash1Current == UIImage(named: "battery")?.pngData() ||
                trash1Current == UIImage(named: "tissue")?.pngData(){
                pts += 25
                self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
                self.trash1.isHidden = true
                self.trash1.frame.origin.y = 203.0
                self.secTimer.invalidate()
                
            } else {
                stopGame()
            }
            
        default:
            break
        }
    }
    
    // TRASH2
    @objc func swipeAction2(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 2:
            // Left
            let trash2Current = trash2.image!.pngData()
            
            if trash2Current == UIImage(named: "battery")?.pngData() ||
                trash2Current == UIImage(named: "tissue")?.pngData(){
                pts += 25
                self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
                self.trash2.isHidden = true
                self.trash2.frame.origin.y = 203.0
                self.secTimer2.invalidate()
                
            } else {
                stopGame()
            }
            
        default:
            break
        }
    }
    
    // RIGHT SWIPES
    
    // TRASH1
    @objc func swipeAction3(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            // Right
            let trash1Current = trash1.image!.pngData()
            
            if trash1Current == UIImage(named: "cardboard")?.pngData() ||
                trash1Current == UIImage(named: "bag")?.pngData(){
                pts += 25
                self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
                self.trash1.isHidden = true
                self.trash1.frame.origin.y = 203.0
                self.secTimer.invalidate()
                
            } else {
                stopGame()
            }
            
        default:
            break
        }
    }
    
    // TRASH2
    @objc func swipeAction4(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            // Right
            let trash2Current = trash2.image!.pngData()
            
            if trash2Current == UIImage(named: "cardboard")?.pngData() ||
                trash2Current == UIImage(named: "bag")?.pngData(){
                pts += 25
                self.statsLabel.text = "POINTS: \(self.pts) FUEL: \(self.fuel)"
                self.trash2.isHidden = true
                self.trash2.frame.origin.y = 203.0
                self.secTimer2.invalidate()
                
            } else {
                stopGame()
            }
            
        default:
            break
        }
    }
}

