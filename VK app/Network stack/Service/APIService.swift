//
//  APIService.swift
//  VK app
//
//  Created by Maxim Bekmetov on 27.06.2021.
//

import Foundation
import Alamofire
import DynamicJSON
import RealmSwift

//struct User {}

final class APIService {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let cliendId = Session.shared.userId
    let version = "5.21"
    
    func getFriendsQuicktype(completion: @escaping([UserModel])->()) {
   
           let method = "/friends.get"
   
           let parameters: Parameters = [
               "user_id": cliendId,
               "order": "name",
               "count": 100,
               "fields": "photo_100, photo_50",
               "access_token": Session.shared.token,
               "v": version]
   
           let url = baseUrl + method
   
   
           AF.request(url, method: .get, parameters: parameters).responseData { response in
   
               print(response.request as Any)
               
               guard let data = response.data else { return }
               print(data.prettyJSON as Any)
               
               guard let items = JSON(data).response.items.array else { return }
               
               let friend: [UserModel] = items.map{ UserModel(data: $0) }
               
               DispatchQueue.main.async {
                   completion([friend])
               }
           }
       }
    
    
//    func getFriendsQuicktype(completion: @escaping([User])->()) {
//
//        let method = "/friends.get"
//
//        let parameters: Parameters = [
//            "user_id": cliendId,
//            "order": "name",
//            "count": 100,
//            "fields": "photo_100",
//            "access_token": Session.shared.token,
//            "v": version]
//
//        let url = baseUrl + method
//
//
//        AF.request(url, method: .get, parameters: parameters).responseData { response in
//
//            guard let data = response.data else { return }
//           // print(data.prettyJSON)
//
//            let friendsResponse = try? JSONDecoder().decode(Friends.self, from: data)
//
//            guard let friends = friendsResponse?.response.items else { return }
//
//            DispatchQueue.main.async {
//                completion(friends)
//            }
//        }
//    }
//
//    func getGroupsQuicktype(completion: @escaping([Groupp])->()) {
//
//        let method = "/groups.get"
//
//        let parameters: Parameters = [
//            "user_id": cliendId,
//            "extended": 1,
//            "filter": "groups",
//            "fields": "photo_100",
//            "access_token": Session.shared.token,
//            "v": version
//        ]
//
//        let url = baseUrl + method
//
//
//        AF.request(url, method: .get, parameters: parameters).responseData { response in
//
//            print(response.request)
//
//            guard let data = response.data else { return }
//           // print(data.prettyJSON)
//
//            print(data.prettyJSON)
//
//            let groupsResponse = try? JSONDecoder().decode(Groups.self, from: data)
//
//            guard let groups = groupsResponse?.response.items else { return }
//
//            DispatchQueue.main.async {
//                completion(groups)
//            }
//        }
//    }
//
//    func getPhotosQuicktype(completion: @escaping([Photoo])->()) {
//
//        let method = "/photos.get"
//
//        let parameters: Parameters = [
//            "owner_id": cliendId,
//            "album_id": "wall",
//            "photo_ids": "photo_ids",
//            "rev": 1,
//            "extended": 0,
//            "photo_sizes": 0,
//            "access_token": Session.shared.token,
//            "v": version
//        ]
//
//        let url = baseUrl + method
//
//
//        AF.request(url, method: .get, parameters: parameters).responseData { response in
//
//            guard let data = response.data else { return }
//           // print(data.prettyJSON)
//
//            let photosResponse = try? JSONDecoder().decode(Photos.self, from: data)
//
//            guard let photos = photosResponse?.response.items else { return }
//
//            DispatchQueue.main.async {
//                completion(photos)
//            }
//        }
//    }
    
//    func getFriendsManual(completion: ([User])->()) {
//
//        let method = "/friends.get"
//
//        let parameters: Parameters = [
//            "user_id": cliendId,
//            "order": "name",
//            "count": 100,
//            "fields": "photo_100",
//            "access_token": Session.shared.token,
//            "v": version]
//
//        let url = baseUrl + method
//
//        AF.request(url, method: .get, parameters: parameters).responseData { response in
//
//
//            guard let data = response.data else { return }
//            print(data.prettyJSON)
//
//            guard let json = try? JSONSerialization.jsonObject(with: data, options:.mutableContainers) else { return }
//
//            let object = json as! [String: Any]
//            let response = object["response"] as! [String: Any]
//            let items = response["items"] as! [Any]
//
//            for userJson in items {
//                let userJson  = userJson as! [String: Any]
//                let id = userJson["id"] as! Int
//                let lastName = userJson["last_name"] as! String
//                let firstName = userJson["first_name"] as! String
//
//                print(id, firstName, lastName)
//            }
//        }
//
//        completion([])
//
//    }
//
//    func getGroupsManual(completion: ([User])->()) {
//        let method = "/groups.get"
//
//        let parameters: Parameters = [
//            "user_id": cliendId,
//            "extended": 1,
//            "filter": "groups",
//            "fields": "photo_100",
//            "access_token": Session.shared.token,
//            "v": version
//        ]
//
//        let url = baseUrl + method
//
//        AF.request(url, method: .get, parameters: parameters).responseData { response in
//            guard let data = response.data else { return }
//            print(data.prettyJSON)
//
//            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return }
//
//            let object = json as! [String: Any]
//            let response = object["response"] as! [String: Any]
//            let items = response["items"] as! [Any]
//
//            for userJson in items {
//                let userJson  = userJson as! [String: Any]
//                let id = userJson["id"] as! Int
//                let lastName  = userJson["name"] as! String
//                let firstName = userJson["screen_name"] as! String
//
//                print(id, firstName, lastName)
//            }
//        }
//        completion([])
//    }
}
