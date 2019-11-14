//
//  CreateEventViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/6/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
   
    
    //declare properties
    @IBOutlet weak var OutletFontButton: UIButton!
    
    @IBOutlet weak var OutletFontColorButton: UIButton!
    
    
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
        let event = UserDefaults.standard
        
//
//        if event.value(forKey: "eventFont") != nil   {
//            lbFont.text = event.value(forKey: "eventFont") as! String
//            lbFont.font = UIFont(name: event.value(forKey: "eventFont") as! String, size: 17)
//
//        } else {
//            lbFont.text = "Arial"
//            lbFont.font = UIFont(name: "Arial", size: 17)
//        }
//
//        if event.value(forKey: "eventFontColor") != nil {
//            vwFontColor.backgroundColor = hexStringToUIColor(event.value(forKey: "eventFontColor") as! String)
////            vwFontColor.restorationIdentifier = event.value(forKey: "eventFontColor") as! String
//        } else {
//            vwFontColor.backgroundColor = hexStringToUIColor("000000")
////            vwFontColor.restorationIdentifier = "000000"
//        }
//
//
        
        lbFont.text = "Arial"
        lbFont.font = UIFont(name: "Arial", size: 17)
        vwFontColor.backgroundColor = hexStringToUIColor("000000")
        
        
        
        
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //buttons choose font for event
    @IBAction func chooseFontTapped(_ sender: Any) {
    }
    
    //buttons choose font color for event
    @IBAction func chooseFontColorTapped(_ sender: Any) {
    }
    

    
    
    //buttons add detail guest
    @IBAction func addDetailTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GuestAddViewController") as! GuestAddViewController
        
        self.present(vc, animated: true, completion: nil)
    
    }
    
    @IBAction func sldFontSize(_ sender: Any) {
//        lbFontSize.text = "\(Int(sldFontSize.value))"
        lbFontSize.text = String(format: "%.1f", sldFontSize.value)
    }
       
    @IBAction func saveTapped(_ sender: Any) {
        UserDefaults.standard.setValue(txtEventName.text, forKey: "eventName")
        //print(UserDefaults.standard.value(forKey: "eventName"))
        UserDefaults.standard.setValue(lbFont.text, forKey: "eventFont")
        //print(UserDefaults.standard.value(forKey: "eventFont")
        UserDefaults.standard.setValue(vwFontColor.restorationIdentifier, forKey: "eventFontColor")
        //print(UserDefaults.standard.value(forKey: "eventFontColor"))
       // print(Int(sldFontSize.value))
        UserDefaults.standard.setValue(sldFontSize.value, forKey: "eventFontSize")
       
    }
    

    
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

extension CreateEventViewController : UIPopoverPresentationControllerDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopupFont" {
           let pvc: PopupChooseFontViewController = segue.destination as! PopupChooseFontViewController
           pvc.popoverPresentationController!.delegate = self
            pvc.delegate = self
            
           let presentationViewController = pvc.popoverPresentationController
            presentationViewController?.permittedArrowDirections = .up
           presentationViewController?.delegate = self
           presentationViewController?.sourceView = OutletFontButton
           presentationViewController?.sourceRect = OutletFontButton.bounds
        } else if segue.identifier == "toPopupFontColor" {
            let pvc: PopupChooseFontColorViewController = segue.destination as! PopupChooseFontColorViewController
            pvc.popoverPresentationController!.delegate = self
            pvc.delegate = self
            
            
            let presentationViewController = pvc.popoverPresentationController
            presentationViewController?.permittedArrowDirections = .up
            presentationViewController?.delegate = self
            presentationViewController?.sourceView = OutletFontColorButton
            presentationViewController?.sourceRect = OutletFontColorButton.bounds
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
        
    }
}


extension CreateEventViewController: FontDelegate, FontColorDelegate {
    func fontColorShow(color: String) {
       // print(color)
        vwFontColor.backgroundColor = hexStringToUIColor(color)
        vwFontColor.restorationIdentifier = color //to save name of color by hex
        
       
        //lbFont.textColor = hexStringToUIColor(color)
    }
    
    func fontShow(font: String) {
        lbFont.text = font
        
        lbFont.font = UIFont(name: font, size: 17)
    }
}
