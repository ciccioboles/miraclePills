//
//  ViewController.swift
//  Pills
//
//  Created by David Boles on 9/7/16.
//  Copyright © 2016 David Boles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var extraPracticeTitle: UILabel!
    @IBOutlet weak var extraPracticeTextField: UITextField!
    let states = ["California", "Texas", "Idaho", "New York", "Hawaii", "Utah"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statePicker.dataSource = self
        statePicker.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
                
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stateButtonPressed(_ sender: Any) {
        
        statePicker.isHidden = false
        extraPracticeTitle.isHidden = true
        extraPracticeTextField.isHidden = true
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState()) //.normal known bug in beta
        statePicker.isHidden = true
    }
    
//    @IBAction func buyNowBtn(_ sender: AnyObject) {
//        for i in 1...14 {
//            self.view.viewWithTag(i)?.isHidden = true
//        }
//        
//    }
    
    
//    @IBAction func buyNowButtonPressed(_ sender: Any) {
//        for view in self.view.subviews as [UIView] {
//            view.isHidden = true
//        }
//        successImage.isHidden = false
//    }
    
    
}


