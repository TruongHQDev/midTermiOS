//
//  GuestEditViewController.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/20/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class GuestEditViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtGuestFriend: UITextField!
    
    @IBOutlet weak var txtTable: UITextField!
    
    @IBOutlet weak var txtSection: UITextField!
    
    
    //var delegate : EditGuestDelegate?
    
    var dataGuest = ViewGuest()
    
    
    func guestNeedEdit(guest: Guest) {
        //guard let firstName = guest.firstName, let lastName = guest.lastName, let guestFriend = guest.guests, let table = guest.table, let section = guest.section  else {return}
        
        
        txtFirstName.text = guest.firstName
        txtLastName.text = guest.lastName
        txtGuestFriend.text = guest.guests
        txtTable.text = guest.table
        txtSection.text = guest.section
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //guestNeedEdit(guest: dataGuest)
        txtFirstName.text = dataGuest.firstName
        txtLastName.text = dataGuest.lastName
        txtGuestFriend.text = dataGuest.guests
        txtTable.text = dataGuest.table
        txtSection.text = dataGuest.section
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        
        
    }
    
    
    


}
