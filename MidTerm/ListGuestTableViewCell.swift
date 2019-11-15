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
        lbName.text = "\(guest.firstName),\(guest.lastName)"
        lbGuest.text = guest.guestString()
        lbTable.text = guest.table
        lbSection.text = guest.section
    }

}
