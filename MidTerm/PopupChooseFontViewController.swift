//
//  PopupChooseFontViewController.swift
//  MidTerm
//
//  Created by Ha Quang Truong on 11/8/19.
//  Copyright © 2019 Ha Quang Truong. All rights reserved.
//

import UIKit

class PopupChooseFontViewController: UIViewController {
    @IBOutlet weak var pickerViewFont: UIPickerView!
   var delegate:FontDelegate?
    
    
    var fonts : [String] = []
    let fontFamilyNames = UIFont.familyNames
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewFont.dataSource = self
        pickerViewFont.delegate = self
        
        for familyName in fontFamilyNames {
            fonts.append("\(familyName)")
        }
    }
    
    var fontTemp:String!
    @IBAction func okTapped(_ sender: Any) {
        
        delegate?.fontShow(font: fontTemp!)
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}

extension PopupChooseFontViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fonts.count
    }
    
     
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = view as? UILabel ?? UILabel()
        label.font = UIFont(name: "\(fonts[row])", size: 17)
        //label.textColor = .white
        label.textAlignment = .center
        label.text = fonts[row]
        return label
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fontTemp = fontFamilyNames[row]
    }
    
}


