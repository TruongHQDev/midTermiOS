//
//  AdminMainViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/6/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class AdminMainViewController: UIViewController {

    @IBOutlet weak var createEvent: UIView!
    
    @IBOutlet weak var editEvent: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createEvent.layer.borderWidth = 1
        createEvent.layer.borderColor = UIColor.blue.cgColor
        
        editEvent.layer.borderWidth = 1
        editEvent.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createEventTapped(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "PopupCreateEventNotiViewController") as! PopupCreateEventNotiViewController
//        present(vc, animated: false, completion: nil)
//        
    }
    @IBAction func editEventTapped(_ sender: Any) {
        
    }
    
}
