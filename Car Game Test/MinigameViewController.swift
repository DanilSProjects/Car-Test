//
//  MinigameViewController.swift
//  Car Game Test
//
//  Created by Daniel on 17/3/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class MinigameViewController: UIViewController {
    
    var earnedFuel = 0
    var fuelAddition = 1
    var activeTrash = 0
    var trashArray: [Trash] = [Trash(imageName: "bag", descName: "Plastic Bag"), Trash(imageName: "cardboard", descName: "Cardboard Box"), Trash(imageName: "battery", descName: "Alkaline Battery"), Trash(imageName: "tissue", descName: "Used Tissue Paper")]
    
    @IBOutlet weak var toGoLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var trashView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if equippedEngine == "turbo" {
            fuelAddition = 2
        } else {
            fuelAddition = 1
        }
       let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.leftSwipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.rightSwipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(rightSwipe)
        update()
        earnedFuel = 0
        activeTrash = 0
    }
    
    func update() {
        if activeTrash == 4 {
            fuel += earnedFuel
            if earnedFuel == 0 {
                fuel = 0
            }
            performSegue(withIdentifier: "unwind", sender: self)
        } else {
        toGoLabel.text = "\(trashArray.count - activeTrash) TO GO"
        fuelLabel.text = "Fuel Earned: \(earnedFuel)"
        trashView.image = UIImage(named: trashArray[activeTrash].imageName)
        nameLabel.text = "\(trashArray[activeTrash].descName)"
        }
    }
    
    @objc func leftSwipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 2:
            // Left
            let trashCurrent = trashView.image!.pngData()
            
            if trashCurrent == UIImage(named: "cardboard")?.pngData() ||
                trashCurrent == UIImage(named: "bag")?.pngData(){
                earnedFuel += 0
                activeTrash += 1
                update()
            } else if trashCurrent == UIImage(named: "battery")?.pngData() ||
                trashCurrent == UIImage(named: "tissue")?.pngData(){
                earnedFuel += fuelAddition
                activeTrash += 1
                update()
            }
            
        default:
            break
        }
    }
    
    
    @objc func rightSwipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            // Right
            let trashCurrent = trashView.image!.pngData()
            
            if trashCurrent == UIImage(named: "cardboard")?.pngData() ||
                trashCurrent == UIImage(named: "bag")?.pngData(){
                earnedFuel += fuelAddition
                activeTrash += 1
                update()
            } else if trashCurrent == UIImage(named: "battery")?.pngData() ||
                trashCurrent == UIImage(named: "tissue")?.pngData(){
                earnedFuel += 0
                activeTrash += 1
                update()
            }
        default:
            break
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
