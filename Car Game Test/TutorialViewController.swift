//
//  TutorialViewController.swift
//  Car Game Test
//
//  Created by Daniel on 2/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var cardboardBox: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction(swipe:)))
        swipe.direction = UISwipeGestureRecognizer.Direction.right
        self.cardboardBox.addGestureRecognizer(swipe)
    }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer) {
        switch swipe.direction.rawValue {
        case 1:
            performSegue(withIdentifier: "tutNext1", sender: nil)
            
        default:
            break
        }
    }

}
