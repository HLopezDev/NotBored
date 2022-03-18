//
//  ActivitiesModel.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//

import Foundation

enum ActivityType {
    case education
    case recreational
    case social
    case diy
    case charity
    case cooking
    case relaxation
    case music
    case busywork
}

enum ActivityPrice {
    case free
    case low
    case medium
    case hight
        
}

struct ActivitiesModel {
    
    let activity: String
    let accesibility: Double
    let type: ActivityType
    let participants: Int
    let price: ActivityPrice
    let link: String?
    let key: String
}
