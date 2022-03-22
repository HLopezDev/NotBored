//
//  ActivitiesModel.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//

import Foundation
import Alamofire

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
}
//struct ActivityType: Decodable {
//  let education: String
//  let recreational: String
//  let social: String
//  let diy: String
//  let charity: String
//  let cooking: String
//  let relaxation: String
//  let music: String
//  let busywork: String
//
//    enum CodingKeys: String, CodingKey {
//    case education = "education"
//    case recreational = "recreational"
//    case social = "social"
//    case diy = "diy"
//    case charity = "charity"
//    case cooking = "cooking"
//    case relaxation = "relaxation"
//    case music = "music"
//    case busywork = "busywork"
//  }
//}

struct ActivityPrice: Decodable {
    let free: String
    let low: String
    let medium: String
    let hight: String

    enum CondingKeys: String, CodingKey {
        case free
        case low
        case medium
        case hight
    }
}

struct Activity: Decodable {
    
    let activity: String
    var accesibility: Double?
    let type: String
    let participants: Int
    let price: Double
    let link: String?
    let key: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        activity = try values.decode(String.self, forKey: .activity)
        accesibility = try values.decodeIfPresent(Double.self, forKey: .accesibility)
        type = try values.decode(String.self, forKey: .type)
        participants = try values.decode(Int.self, forKey: .participants)
        price = try values.decode(Double.self, forKey: .price)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        key = try values.decode(String.self, forKey: .key)
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
    
    static func getActivity(_ participants: Int, type: ActivityType,  completion: @escaping (Result<Activity, NetworkError>) -> Void) {
        let url: String = "https://www.boredapi.com/api/activity?participants=\(participants)&type=\(type.rawValue)"
        let request = AF.request(url)
        request.responseDecodable(of: Activity.self) { (response) in
//            print("activity: \(response)")
            guard let activity = response.value else {
                return completion(.failure(.badDecodable))
            }
            return completion(.success(activity))
        }
    
    }
    
    static func getActivityList(_ participants: Int) -> [Activity] {
        var activities: [Activity] = []
        for type in ActivityType.allCases {
            getActivity(participants, type: type, completion: { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let activity):
                    print(activity)
                    print("Esta armando el array")
                    activities.append(activity)
                }
            })
        }
        print("la primera de las actividades es: \(activities)")
        return activities
    }
//    TODO: Configuring an asyncronous call for this methods. 
}

        
enum NetworkError: Error {
    case badDecodable
}


//success({
//    accessibility = "0.3";
//    activity = "Go to a concert with local artists with some friends";
//    key = 2211716;
//    link = "";
//    participants = 3;
//    price = "0.4";
//    type = social;
//})


