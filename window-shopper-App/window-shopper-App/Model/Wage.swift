//
//  Wage.swift
//  window-shopper-App
//
//  Created by Юра Маргітич on 05.07.2021.
//

import Foundation

class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
