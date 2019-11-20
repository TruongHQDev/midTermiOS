//
//  GuestAddViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/7/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit
import RealmSwift
import StatusAlert

class GuestAddViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtGuestFriend: UITextField!
    
    @IBOutlet weak var txtTable: UITextField!
    
    @IBOutlet weak var txtSection: UITextField!
    
    var delegate: NotificationAddGuestDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the vi
        
    
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        //save data to realm
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
       
        let a = Guest()
         if let firstName = txtFirstName.text, let lastName = txtLastName.text, let guests = txtGuestFriend.text, let table = txtTable.text, let section = txtSection.text {
                     a.firstName = firstName
                     a.lastName = lastName
                     a.guests = guests
                     a.table = table
                     a.section = section
                 print(a)
                     do {
                         try realm.write {
                             realm.add(a)
                         }
                     } catch {
                         print(error.localizedDescription)
                     }
                 } else {
                    print(Error.self)
                     return
                 }
         

         delegate?.isAddedGuest(added: true)
         let savedAlert = StatusAlert()
        savedAlert.image = UIImage(named: "tick")
        savedAlert.title = "Saved"
        
        savedAlert.showInKeyWindow()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            self.dismiss(animated: true, completion: nil)
        }
         
  
        
        
        
    }
    
}
