//
//  GuestEditViewController.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/20/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit
import RealmSwift


class GuestEditViewController: UIViewController {
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtGuestFriend: UITextField!
    
    @IBOutlet weak var txtTable: UITextField!
    
    @IBOutlet weak var txtSection: UITextField!
    
    
    var delegate : NotificationEditGuestDelegate?
    
    var dataGuest = ViewGuest()
    var idInDB: Int? = nil
    let realm = RealmService.shared.realm

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        txtFirstName.text = dataGuest.firstName
        txtLastName.text = dataGuest.lastName
        txtGuestFriend.text = dataGuest.guests
        txtTable.text = dataGuest.table
        txtSection.text = dataGuest.section

       

    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func saveTapped(_ sender: Any) {
        var g = Guest()
        guard let firstName = txtFirstName.text, let lastName = txtLastName.text, let guestFriend = txtGuestFriend.text, let table = txtTable.text, let section = txtSection.text  else {return}
        g.firstName = firstName
        g.lastName = lastName
        g.guests = guestFriend
        g.table = table
        g.section = section
    
        guard let id = idInDB else {return}
        if realm.objects(Guest.self).count > id {
            print(realm.objects(Guest.self).count)
            print(id)
            do {
                try! realm.write {
                    realm.objects(Guest.self)[id].firstName = g.firstName
                    realm.objects(Guest.self)[id].lastName = g.lastName
                    realm.objects(Guest.self)[id].guests = g.guests
                    realm.objects(Guest.self)[id].table = g.table
                    realm.objects(Guest.self)[id].section = g.section
                }
                delegate?.isEditGuest(added: true)
                dismiss(animated: true, completion: nil)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print(Error.self)
        }
    }
}
