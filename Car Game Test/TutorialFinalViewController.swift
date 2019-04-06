//
//  TutorialFinalViewController.swift
//  Car Game Test
//
//  Created by Daniel on 6/4/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import UIKit

class TutorialFinalViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPress(_ sender: Any) {
    self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
