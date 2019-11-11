//
//  PopupCreateEventNotiViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/6/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class PopupCreateEventNotiViewController: UIViewController {
    @IBOutlet weak var circleNoti: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        circleNoti.layer.borderWidth = 2
        circleNoti.layer.borderColor = UIColor.white.cgColor
        
    }
    
    
    @IBAction func okTapped(_ sender: Any) {
        
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
