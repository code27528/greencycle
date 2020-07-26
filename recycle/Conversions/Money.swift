//
//  Money.swift
//  recycle
//
//  Created by Sohom Dutta on 7/20/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import Foundation

class Money{
    class func calculateAmount(forUnder underAmount: Double, andOver overAmount: Double) -> Double{
        return floor(100*(0.05 * underAmount + 0.1 * overAmount))/100
    }
}
