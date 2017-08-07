//
//  ViewController.swift
//  Unit Converter
//
//  Created by Vladislav Fedotovskiy on 25.01.17.
//  Copyright © 2017 Vladislav Fedotovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let temperatureRange = (-100...100).reversed().map{ $0 }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        let selectedRow = Int(temperatureRange.count/2)
        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
        
        
        let savedValue:Int = UserDefaults.standard.integer(forKey: "SourceValue")
     
        
        
        
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}



extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureRange.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureRange[row])˚C"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let result = UnitConverter.degreesFahrenheit(_degreesCelcius: temperatureRange[row])
        temperatureLabel.text = "\(result)˚F"
        
        UserDefaults.standard.set(temperatureRange[row], forKey: "SourceValue")
        UserDefaults.standard.synchronize()
    
    }
    
    
}



class UnitConverter {
    
    class func degreesFahrenheit(_degreesCelcius:Int) -> Int {
        
        
    return Int(1.8*Float(_degreesCelcius) + 32.0)
    
        
    }
    
    
    
}
