//
//  TutorialFuelViewController.swift
//  Car Game Test
//
//  Created by Daniel on 6/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class TutorialFuelViewController: UIViewController {

    @IBOutlet weak var bag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(swipe:)))
        swipe.direction = UISwipeGestureRecognizer.Direction.right
        self.bag.addGestureRecognizer(swipe)
    }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            performSegue(withIdentifier: "tutNext2", sender: nil)
            
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
