//
//  Guest.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/18/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import Foundation
import RealmSwift

class Guest: Object {
    @objc dynamic var firstName : String?
    @objc dynamic var lastName  : String?
    @objc dynamic var guests    : String?
    @objc dynamic var table     : String?
    @objc dynamic var section   : String?
}
