//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Rafael Benjamin on 17/07/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
