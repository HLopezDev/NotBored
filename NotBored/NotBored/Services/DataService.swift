//
//  DataService.swift
//  NotBored
//
//  Created by Hector Orlando Lopez Orozco on 24/03/22.
//

import Foundation
import Alamofire


class DataService {
    
    static func getData(_ participants: Int, type: String,  completion: @escaping (Result<Activity, NetworkError>) -> Void) {
        let url: String = "https://www.boredapi.com/api/activity?participants=\(participants)&type=\(type)"
        let request = AF.request(url)
        request.responseDecodable(of: Activity.self) { (response) in
            guard let activity = response.value else {
                return completion(.failure(.badDecodable))
            }
            return completion(.success(activity))
        }
    }
    
    static func getRandomData(_ participants: Int,  completion: @escaping (Result<Activity, NetworkError>) -> Void) {
        let url: String = "https://www.boredapi.com/api/activity?participants=\(participants)"
        let request = AF.request(url)
        request.responseDecodable(of: Activity.self) { (response) in
            guard let activity = response.value else {
                return completion(.failure(.badDecodable))
            }
            return completion(.success(activity))
        }
    }
}

enum NetworkError: Error {
    case badDecodable
}
