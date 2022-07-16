//
//  TripCell.swift
//  EXPOSUREDIARY APP
//
//  Created by Lee, Christopher on 10/30/21.
//

//
//  CustomCell.swift
//  EXPOSUREDIARY APP
//
//  Created by Lee, Christopher on 10/28/21.
//

import UIKit
import CoreData

class TripCell: UITableViewCell {
    
    @IBOutlet weak var locationsText: UILabel!
    @IBOutlet weak var purposesText: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with trip: Trip) {
        if let title = trip.value(forKey: "location") as? String,
           let password = trip.value(forKey: "purpose") as? String,
           let picture = trip.value(forKey: "picture") as? Int,
           let number = trip.value(forKey: "number") as? Int/*,
           let contacts = trip.value(forKey: "contacts") as? String,
           let color = trip.value(forKey: "color") as? UIColor,
           let image = trip.value(forKey: "image") as? Int*/{
            
            locationsText?.text = title
            purposesText?.text = password

            if number > 3 {
                self.backgroundColor = UIColor.green
            }
            else if number < 3 {
                self.backgroundColor = UIColor.red
            }
            else{
                self.backgroundColor = UIColor.yellow
            }
            
            if let weatherType = WeatherType(rawValue: picture) {
                ratingImage.image = weatherType.image()
            }
            
            /*contactNumber?.text = contacts
            self.backgroundColor = color
                        
            if let ratingType = RatingType(rawValue: image) {
                ratingImage.image = ratingType.image()
            }*/
            
        }
    }
    
}

