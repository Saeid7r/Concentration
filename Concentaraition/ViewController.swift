//
//  ViewController.swift
//  Concentaraition
//
//  Created by saeed rad on 2018-03-17.
//  Copyright © 2018 saeed rad. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    @IBAction func flip(_ sender: Card) {
        sender.flip()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

