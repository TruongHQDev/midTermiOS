//
//  RealmSwift.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/15/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import Foundation
import RealmSwift


class RealmService {
    
    private init() {}
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    
    
}
