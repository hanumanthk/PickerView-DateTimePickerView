//
//  ViewController.swift
//  pickerViewPractice
//
//  Created by iOS Training on 1/6/19.
//  Copyright © 2019 iOS Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var arrStates = ["Odisha", "Maharastra", "Karnataka", "Telengana", "Andhra Pradesh", "Kerala", "UP", "MP"]
    var pickerView: UIPickerView!
    var datePickerView: UIDatePicker!
    
    @IBOutlet var txtFieldState: UITextField!
    
    
    @IBOutlet weak var txtFieldDateTime: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDateTimePickerView()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView = UIPickerView.init(frame: CGRect.init(x: 0, y: 0, width: CGFloat(self.view.frame.size.width), height: 250))
        txtFieldState.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        
        var toolBar = UIToolbar.init(frame: CGRect.init(x: 0, y: 0, width: CGFloat(self.view.frame.size.width), height: 40))
        let cancelBarbuttonITem = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(onClickOfCancel))
        
        let doneBarbuttonITem = UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(onClickOfDone))
        
        let spaceITem = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolBar.items = [cancelBarbuttonITem, spaceITem, doneBarbuttonITem]
        
        txtFieldState.inputAccessoryView = toolBar
        
    }
    
    
    
    func configureDateTimePickerView() {
        datePickerView = UIDatePicker.init(frame: CGRect.init(x: 0, y: 0, width: CGFloat(self.view.frame.size.width), height: 250))
        datePickerView.minimumDate = Date.init()
        datePickerView.maximumDate = Date.init().addingTimeInterval(172800)
        txtFieldDateTime.inputView = datePickerView
        
        var toolBar = UIToolbar.init(frame: CGRect.init(x: 0, y: 0, width: CGFloat(self.view.frame.size.width), height: 40))
        let cancelBarbuttonITem = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(onClickOfCancelDatePicker))
        
        let doneBarbuttonITem = UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(onClickOfDoneDatePicker))
        
        let spaceITem = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolBar.items = [cancelBarbuttonITem, spaceITem, doneBarbuttonITem]
        
        txtFieldDateTime.inputAccessoryView = toolBar
        
        
        
        
    }
    
    
    
    @objc func onClickOfCancel() {
        txtFieldState.resignFirstResponder()
    }
    
    @objc func onClickOfDone() {
        txtFieldState.resignFirstResponder()
        txtFieldState.text = arrStates[pickerView.selectedRow(inComponent: 0)]
    }
    
    @objc func onClickOfCancelDatePicker() {
       txtFieldDateTime.resignFirstResponder()
    }
    
    @objc func onClickOfDoneDatePicker() {
       txtFieldDateTime.resignFirstResponder()
        let selectedDate = datePickerView.date
        
        let formatter = DateFormatter.init()
        formatter.dateFormat = "d MMM yyyy h:mm a"
        let strDate = formatter.string(from: selectedDate)
        txtFieldDateTime.text = strDate
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return arrStates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrStates[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Hey I selected \(arrStates[row])")
        
    }

}



