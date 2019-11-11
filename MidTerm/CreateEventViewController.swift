//
//  CreateEventViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/6/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, PickerViewFont {
    func isCancel(cancel: Bool) {
        
        
        
        print("here")
    }
    
    
    //declare popup
    @IBOutlet weak var popupChooseFontView: UIView!
    var popupChooseFontViewController: PopupChooseFontViewController?
    
    
    
    @IBOutlet weak var popupChooseFontColorView: UIView!
    
    //declare properties
    
    @IBOutlet weak var txtEventName: UITextField!
    
    //labels font
    @IBOutlet weak var lbFont: UILabel!
    
    @IBOutlet weak var lbFontSize: UILabel!
    
    
    //slider
    @IBOutlet weak var sldFontSize: UISlider!
    
    
    //view font color
    @IBOutlet weak var vwFontColor: UIView!
    
    //table
    @IBOutlet weak var tableGuests: UITableView!
    
    
    //variables to show and hide pop up
    var isFontHide = true
    var isFontColorHide = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        
        popupChooseFontView.isHidden = false
        popupChooseFontColorView.isHidden = true
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //buttons choose font for event
    @IBAction func chooseFontTapped(_ sender: Any) {
        if isFontHide {
            popupChooseFontView.isHidden = false
            isFontHide = false
        } else {
            popupChooseFontView.isHidden = true
            isFontHide = true
        }
        
    }
    
    //buttons choose font color for event
    @IBAction func chooseFontColorTapped(_ sender: Any) {
        if isFontColorHide {
            popupChooseFontColorView.isHidden = false
            isFontColorHide = false
        } else {
            popupChooseFontColorView.isHidden = true
            isFontColorHide = true
        }
        
    }
    

    
    
    //buttons add detail guest
    @IBAction func addDetailTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuestAddViewController") as! GuestAddViewController
        
        self.present(vc, animated: true, completion: nil)
    
    }
    
    @IBAction func sldFontSize(_ sender: Any) {
        lbFontSize.text = "\(Int(sldFontSize.value))"
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "eventToPopupFont" {
//            popupChooseFontViewController = segue.destination as? PopupChooseFontViewController
//            popupChooseFontViewController!.pickerViewFontShow = self
//        }
//    }
    
//    func isCancel(cancel: Bool) {
//       // popupChooseFontView.isHidden = cancel ? true : false
//        if cancel {
//            popupChooseFontView.isHidden = true
//            print("here")
//        } else {
//            popupChooseFontView.isHidden = false
//        }
//    }
    
    
    
    
    
    
}


//tap to hide keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
