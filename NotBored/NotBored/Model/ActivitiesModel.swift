//
//  ActivitiesModel.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//
import Foundation
import Alamofire

class ActivitiesModel {
    
    static func getCategory() -> [String]{
        ActivityType.allCases.map( { $0.rawValue })
    }
    
    enum ActivityType: String, CaseIterable {
        case education = "education"
        case recreational = "recreational"
        case social = "social"
        case diy = "diy"
        case charity = "charity"
        case cooking = "cooking"
        case relaxation = "relaxation"
        case music = "music"
        case busywork = "busywork"
        case random = "random"
    }
}

struct Activity: Decodable, Equatable {
    
    let activity: String
    var accesibility: Double?
    let type: String
    let participants: Int
    var price: String = ""
    let link: String?
    let key: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activity = try values.decode(String.self, forKey: .activity)
        accesibility = try values.decodeIfPresent(Double.self, forKey: .accesibility)
        type = try values.decode(String.self, forKey: .type).capitalized
        participants = try values.decode(Int.self, forKey: .participants)
        let temPrice = try values.decode(Double.self, forKey: .price)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        key = try values.decode(String.self, forKey: .key)
        price = getCost(temPrice)
    }
    
    
    
    
    func getCost(_ value: Double) -> String {
        switch value {
            case 0:
            return "Free"
        case 0.1...0.3:
                return "Low"
        case 0.4...0.6:
                return "Medium"
        default:
                return "High"
        }
    }
}

enum CodingKeys: String, CodingKey{
    case activity = "activity"
    case accesibility = "accesibility"
    case type = "type"
    case participants = "participants"
    case price = "price"
    case link = "link"
    case key = "key"
}


   
