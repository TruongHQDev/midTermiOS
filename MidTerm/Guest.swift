//
//  Guest.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/15/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Guest: Object {
    
    @objc dynamic var firstName : String = ""
    @objc dynamic var lastName  : String = ""
    var guests = RealmOptional<Int>()
    @objc dynamic var table     : String = ""
    @objc dynamic var section   : String = ""
    
    
    convenience init(firstName: String, lastName: String, guests: Int?, table: String, section: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.guests.value = guests
        self.table = table
        self.section = section
    }
    
    func guestString() -> String? {
        guard let guests = guests.value else {
            return nil
        }
        return String(guests)
    }
    
}

