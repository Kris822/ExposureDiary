//
//  StatisticsVC.swift
//  EXPOSUREDIARY APP
//
//  Created by Lee, Christopher on 11/1/21.
//

import UIKit
import CoreData

class StatisticsVC: UIViewController {
    
    @IBOutlet weak var StatsTitle: UILabel!
    
    @IBOutlet weak var StatsLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var statsText: UILabel!
    
    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = TableViewController()
        // Do any additional setup after loading the view.
        model.readData()
        let number = model.getRowNum()
        let numberString = String(number)
        statsText.text = numberString
        
        StatsTitle?.text = NSLocalizedString("statistics_text", comment: "statistics")
        StatsLabel?.text = NSLocalizedString("stats_text", comment: "stats")
        
        testButton?.setTitle(NSLocalizedString("stats_button", comment: "the text on the button"), for: .normal)
        cancelButton?.setTitle(NSLocalizedString("cancel_text", comment: "the text on the button"), for: .normal)
        
    }
    @IBAction func onClick(_ sender: Any) {
        StatsAlert(title: "title")
    }
    
    func StatsAlert(title: String/*, completion: @escaping (UIAlertAction) -> Void*/) {
        let alertMsg = NSLocalizedString("look_text", comment: "statistics")
        let alert = UIAlertController(title: NSLocalizedString("statistics_text", comment: "statistics"), message: alertMsg, preferredStyle: .alert)
        
        //let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("cancel_text", comment: "statistics"), style: .cancel)
        
        //alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
