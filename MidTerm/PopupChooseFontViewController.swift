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
   
    var pickerViewFontShow: PickerViewFont?
    var fonts : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewFont.dataSource = self
        pickerViewFont.delegate = self
        
        
        // Do any additilet fontFamilyNames = UIFont.familyNames()
        let fontFamilyNames = UIFont.familyNames
        
        for familyName in fontFamilyNames {
           // print("Font Family Name = [\(familyName)]")
            //let names = UIFont.fontNames(forFamilyName: familyName)
           // print("Font Names = [\(names)]")
            fonts.append("\(familyName)")
        }
    }
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        
        print("cancel")
    }
    
    
    @IBAction func test(_ sender: Any) {
        print("test")
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
    
}


protocol PickerViewFont {
    func isCancel(cancel: Bool)
}
