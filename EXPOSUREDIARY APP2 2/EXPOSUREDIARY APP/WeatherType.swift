//
//  MediaType.swift
//  EXPOSUREDIARY APP
//
//  Created by Lee, Christopher on 10/28/21.
//

import Foundation
import UIKit

enum WeatherType: Int, CaseIterable {
    case sunny, cloudy, raining, snowing
    
    func weather() -> String {
        switch self {
        case .sunny:
            return NSLocalizedString("sunny_text", comment: "it is sunny")
        case .cloudy:
            return NSLocalizedString("cloudy_text", comment: "it is cloudy")
        case .raining:
            return NSLocalizedString("raining_text", comment: "it is raining")
        case .snowing:
            return NSLocalizedString("snowing_text", comment: "it is snowing")
        }
    }
    
    
    
    func image() -> UIImage? {
        switch self {
        case .sunny:
            return UIImage(named: "sunny")
        case .cloudy:
            return UIImage(named: "cloudy")
        case .raining:
            return UIImage(named: "raining")
        case .snowing:
            return UIImage(named: "snowing")
        }
    }
}
