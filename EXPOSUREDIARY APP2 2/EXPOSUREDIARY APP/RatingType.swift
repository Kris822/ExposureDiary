//
//  RatingType.swift
//  EXPOSUREDIARY APP
//
//  Created by Lee, Christopher on 10/28/21.
//


import Foundation
import UIKit

enum RatingType: Int, CaseIterable {
    case great, okay, bad
    
    func weather() -> String {
        switch self {
        case .great:
            return "Great"
        case .okay:
            return "Okay"
        case .bad:
            return "Bad"
        }
    }
    
    
    
    func image() -> UIImage? {
        switch self {
        case .great:
            return UIImage(named: "smile")
        case .okay:
            return UIImage(named: "meh")
        case .bad:
            return UIImage(named: "frown")
        }
    }
}
