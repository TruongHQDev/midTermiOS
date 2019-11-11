//
//  GuestAddViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/7/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class GuestAddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        //save data to realm
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
