//
//  ActivitiesModel.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 18/03/22.
//
import Foundation
import Alamofire

class ActivitiesModel {
    var activitiesType: [ActivityType] = []
//    var activityData: Activity?
//    var vc: ActivitiesTableViewController?
    
    static func getCategory() -> [String]{
        ActivityType.allCases.map( { $0.rawValue })
    }
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
}
    //    func getActivity(_ participants: Int, type: String)-> Activity? {
    //        let url: String = "https://www.boredapi.com/api/activity?participants=\(participants)&type=\(type)"
    //        let request = AF.request(url)
    //        request.response { (response) in
    //            if let data = response.data {
    //                do {
    //                    self.activityData = try JSONDecoder().decode(Activity.self, from: data)
    //                    print(self.activityData)
    //                } catch let error {
    //                    print(error)
    //                }
    //            }
    //        }
    //        return activityData
    //    }
    
    
    
    enum NetworkError: Error {
        case badDecodable
    }
    
struct Activity: Decodable, Equatable {
    
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
    
    static func getData(_ participants: Int, type: String,  completion: @escaping (Result<Activity, NetworkError>) -> Void) {
        let url: String = "https://www.boredapi.com/api/activity?participants=\(participants)&type=\(type)"
        let request = AF.request(url)
        request.responseDecodable(of: Activity.self) { (response) in
            //            print("activity: \(response)")
            guard let activity = response.value else {
                return completion(.failure(.badDecodable))
            }
            print("In get Data \(activity)")
            return completion(.success(activity))
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

