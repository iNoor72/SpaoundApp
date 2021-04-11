//
//  WorkingSpace.swift
//  SpaoundApp
//
//  Created by Noor Walid on 07/04/2021.
//

import Foundation

struct WorkingSpace: Codable {
    var places : [Place]
}

struct Place: Codable {
    var name, address: String
    var price: Int
    var workingDays: String

    enum CodingKeys: String, CodingKey {
        case name, address, price
        case workingDays = "working_days"
    }
}
