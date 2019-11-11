//
//  CreateEventViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/6/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    
    //declare popup
    @IBOutlet weak var popupChooseFontView: UIView!
    
    @IBOutlet weak var popupChooseFontColorView: UIView!
    
    //declare properties
    
    @IBOutlet weak var txtEventName: UITextField!
    
    //labels font
    @IBOutlet weak var lbFont: UILabel!
    
    @IBOutlet weak var lbFontSize: UILabel!
    
    
    //slider
    @IBOutlet weak var sldFontSize: UISlider!
    
    
    //view font color
    @IBOutlet weak var vwFontColor: UIView!
    
    //table
    @IBOutlet weak var tableGuests: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //buttons choose font for event
    @IBAction func chooseFontTapped(_ sender: Any) {
        popupChooseFontView.isHidden = true
    }
    
    //buttons choose font color for event
    @IBAction func chooseFontColorTapped(_ sender: Any) {
        popupChooseFontColorView.isHidden = true
        
        
        
    }
    

    
    
    //buttons add detail guest
    @IBAction func addDetailTapped(_ sender: Any) {

    
    }
    
    
    
    
    
    
    
    
}
