//
//  ViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/5/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set("", forKey: "eventName")
        UserDefaults.standard.set("", forKey: "color")
        
        
    }


}

