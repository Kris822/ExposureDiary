//
//  EditVC.swift
//  EXPOSUREDIARY APP
//
//  Created by Lee, Christopher on 10/28/21.
//

import UIKit
import CoreData

class EditVC: UIViewController {
    
    let weather = [NSLocalizedString("sunny_text", comment: "it is sunny"), NSLocalizedString("cloudy_text", comment: "it is cloudy"), NSLocalizedString("raining_text", comment: "it is raining"), NSLocalizedString("snowing_text", comment: "it is snowing")]
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var locationText: UILabel!
    
    @IBOutlet weak var purposeText: UILabel!
    @IBOutlet weak var purposeField: UITextField!
    
    @IBOutlet weak var contactsText: UILabel!
    @IBOutlet weak var contactsNumber: UILabel!
    @IBOutlet weak var numberStepper: UIStepper!
    
    @IBOutlet weak var rateText: UIStackView!
    @IBOutlet weak var rateSegment: UISegmentedControl!
    //@IBOutlet weak var rateText: UIStackView!
    @IBOutlet weak var moreText: UILabel!
    
    
    @IBOutlet weak var weatherText: UILabel!
    @IBOutlet weak var weatherPicker: UIPickerView!
    
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    
    var contacts = 0 {
        willSet {
            contactsNumber?.text = newValue.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberStepper?.value = 3
        weatherPicker.dataSource = self
        weatherPicker.delegate = self
        
        locationText.text = NSLocalizedString("location_text", comment: "location")
        purposeText.text = NSLocalizedString("purpose_text", comment: "purpose")
        contactsText.text = NSLocalizedString("rate_text", comment: "rating")
        moreText.text = NSLocalizedString("contacts_text", comment: "contacts")
        weatherText.text = NSLocalizedString("weather_text", comment: "weather")
        
        saveButton?.setTitle(NSLocalizedString("save_text", comment: "the text on the button"), for: .normal)
        cancelButton?.setTitle(NSLocalizedString("cancel_text", comment: "the text on the button"), for: .normal)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func onNumberChanged(_ sender: UIStepper) {
        contacts = Int(sender.value)
    }
    
    func saveItem(location: String, purpose: String) {
        let context = AppDelegate.cdContext
        if let entity = NSEntityDescription.entity(forEntityName: "Trip", in: context) {
            let trip = NSManagedObject(entity: entity, insertInto: context)
            trip.setValue(location, forKeyPath: "location")
            trip.setValue(purpose, forKeyPath: "purpose")
            
            trip.setValue(weatherPicker.selectedRow(inComponent: 0), forKey: "picture")
            trip.setValue(Int(numberStepper.value), forKey: "number")
            
            /*trip.setValue(rateSegment.selectedSegmentIndex, forKey: "image")
            trip.setValue(weatherPicker.selectedRow(inComponent: 0), forKey: "color")
            trip.setValue(Int(numberStepper.value), forKey: "number")*/
            

            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save the item. \(error), \(error.userInfo)")
            }
        }
    }
    
    @IBAction func onAdd(_ sender: Any) {
        if let location = locationField?.text, let purpose = purposeField?.text {
            saveItem(location: location, purpose: purpose)
        }
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func onCancel(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
}

extension EditVC: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weather.count
    }
    
    
    
}

extension EditVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return weather[row]
    }
}
