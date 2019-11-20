//
//  ProtocolSup.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/14/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import Foundation


protocol FontDelegate {
    func fontShow(font: String)
}



protocol FontColorDelegate {
    func fontColorShow(color: String)
}



protocol NotificationAddGuestDelegate {
    func isAddedGuest(added: Bool)
}


protocol EditGuestDelegate {
    func guestNeedEdit(guest: Guest)
}
