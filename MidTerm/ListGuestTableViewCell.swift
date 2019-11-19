//
//  ListGuestTableViewCell.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/7/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class ListGuestTableViewCell: UITableViewCell {


    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbGuest: UILabel!
    @IBOutlet weak var lbTable: UILabel!
    @IBOutlet weak var lbSection: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure(with guest: Guest) {
        guard let firstName = guest.firstName, let lastName = guest.lastName, let guestFriend = guest.guests, let table = guest.table, let section = guest.section  else {return}
        
        
        lbName.text = "\(firstName),\(lastName)"
        lbGuest.text = guestFriend
        lbTable.text = table
        lbSection.text = section
    }

}
