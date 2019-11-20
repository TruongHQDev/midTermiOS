//
//  EditEventViewController.swift
//  MidTerm
//
//  Created by AUTO SERVER on 11/20/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit
import RealmSwift


class EditEventViewController: UIViewController {
    //event name
    @IBOutlet weak var txtEventName: UITextField!
    
    //font event
    @IBOutlet weak var lbFont: UILabel!
    
    @IBOutlet weak var lbFontButton: UIButton!
    
    
    //font size event
    @IBOutlet weak var lbFontSize: UILabel!
    
    @IBOutlet weak var lbSldFontSize: UISlider!
    
    //font color event
    @IBOutlet weak var vwFontColor: UIView!
    @IBOutlet weak var lbFontColorButton: UIButton!
    
    //declare something else
    @IBOutlet weak var tableGuest: UITableView!
    
    var dataGuest : [Guest] = []
    
    var delegate: EditGuestDelegate?
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.hideKeyboardWhenTappedAround()
        selectAllObject()
        
        
      let event = UserDefaults.standard
        if event.value(forKey: "eventName") != nil   {
            txtEventName.text = event.value(forKey: "eventName") as! String
        }
     
        if event.value(forKey: "eventFont") != nil   {
            lbFont.text = event.value(forKey: "eventFont") as! String
            lbFont.font = UIFont(name: event.value(forKey: "eventFont") as! String, size: 17)
        } else {
            lbFont.text = "Arial"
            lbFont.font = UIFont(name: "Arial", size: 17)
        }

        if event.value(forKey: "eventFontColor") != nil {
            vwFontColor.backgroundColor = hexStringToUIColor(event.value(forKey: "eventFontColor") as! String)
//            vwFontColor.restorationIdentifier = event.value(forKey: "eventFontColor") as! String
        } else {
            vwFontColor.backgroundColor = hexStringToUIColor("000000")
//            vwFontColor.restorationIdentifier = "000000"
        }
        
        
        if event.value(forKey: "eventFontSize") != nil {
            lbSldFontSize.value = event.value(forKey: "eventFontSize") as! Float
            lbFontSize.text = String(format: "%.1f", lbSldFontSize.value)
        } else {
            lbSldFontSize.value = 17
            lbFontSize.text = String(format: "%.1f", lbSldFontSize.value)
        }
        
        
        
    }
    
     //exit
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sldFontSize(_ sender: Any) {
        lbFontSize.text = String(format: "%.1f", lbSldFontSize.value)
    }
    
    @IBAction func addDetailGuest(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuestAddViewController") as! GuestAddViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
    //get all data
    func selectAllObject() {
        let realm = try! Realm()
        dataGuest.removeAll()
       
        let guests = realm.objects(Guest.self)
        for guest in guests {
           self.dataGuest.append(guest)
        }
       tableGuest.reloadData()
       
    }
    

}

extension EditEventViewController : UIPopoverPresentationControllerDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editToFont" {
           let pvc: PopupChooseFontViewController = segue.destination as! PopupChooseFontViewController
           pvc.popoverPresentationController!.delegate = self
            pvc.delegate = self
            
           let presentationViewController = pvc.popoverPresentationController
            presentationViewController?.permittedArrowDirections = .up
           presentationViewController?.delegate = self
           presentationViewController?.sourceView = lbFontButton
           presentationViewController?.sourceRect = lbFontButton.bounds
        } else if segue.identifier == "editToFontColor" {
            let pvc: PopupChooseFontColorViewController = segue.destination as! PopupChooseFontColorViewController
            pvc.popoverPresentationController!.delegate = self
            pvc.delegate = self
            
            
            let presentationViewController = pvc.popoverPresentationController
            presentationViewController?.permittedArrowDirections = .up
            presentationViewController?.delegate = self
            presentationViewController?.sourceView = lbFontColorButton
            presentationViewController?.sourceRect = lbFontColorButton.bounds
        }
               
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
        
    }
}



extension EditEventViewController: FontDelegate, FontColorDelegate {
    func fontColorShow(color: String) {
        vwFontColor.backgroundColor = hexStringToUIColor(color)
        vwFontColor.restorationIdentifier = color //to save name of color by hex
    }
    
    func fontShow(font: String) {
        lbFont.text = font
        lbFont.font = UIFont(name: font, size: 17)
    }
}



extension EditEventViewController: NotificationAddGuestDelegate {
    func isAddedGuest(added: Bool) {
        if added {
            selectAllObject()
            //tableGuest.reloadData()
        } else {
            print("unadded")
        }
    }
}


extension EditEventViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print(dataGuest)
        return dataGuest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guestCell", for: indexPath) as! ListGuestTableViewCell
        let guest = dataGuest[indexPath.row]
        cell.configure(with: guest)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuestEditViewController") as! GuestEditViewController
      //  print(indexPath.row)
        print(dataGuest[indexPath.row])
        var g = dataGuest[indexPath.row]
        print(g)
        
        vc.dataGuest = mapObject(guest: dataGuest[indexPath.row]) 
        self.present(vc, animated: true, completion: nil)

    }

    
    
}


