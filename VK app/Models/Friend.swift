//
//  FriendsModel.swift
//  VK app
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

struct Friend {
    
    let name: String
    let surname: String
    var fullName: String {
        return name + " " + surname
    }
    let avatar: UIImage?
    let photos: [Photo]
    
    static let list: [Friend] = [
        Friend(name: "Maurisio", surname: "Gonzales", avatar: UIImage(named: "m-1"), photos:
                [Photo(photos: UIImage(named: "m-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-5"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Pablo", surname: "Pablitos", avatar: UIImage(named: "p-1"), photos:
                [Photo(photos: UIImage(named: "p-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Yuki", surname: "Obayashi", avatar: UIImage(named: "y-1"), photos:
                [Photo(photos: UIImage(named: "y-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "June", surname: "Hobson", avatar: UIImage(named: "j-1"), photos:
                [Photo(photos: UIImage(named: "j-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "j-2"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Samanta", surname: "Majeta", avatar: UIImage(named: "s-1"), photos:
                [Photo(photos: UIImage(named: "s-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Norman", surname: "Vazovski", avatar: UIImage(named: "n-1"), photos:
                [Photo(photos: UIImage(named: "n-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-5"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Maurisio", surname: "Gonzales", avatar: UIImage(named: "m-1"), photos:
                [Photo(photos: UIImage(named: "m-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-5"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Pablo", surname: "Pablitos", avatar: UIImage(named: "p-1"), photos:
                [Photo(photos: UIImage(named: "p-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Yuki", surname: "Obayashi", avatar: UIImage(named: "y-1"), photos:
                [Photo(photos: UIImage(named: "y-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "June", surname: "Hobson", avatar: UIImage(named: "j-1"), photos:
                [Photo(photos: UIImage(named: "j-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "j-2"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Samanta", surname: "Majeta", avatar: UIImage(named: "s-1"), photos:
                [Photo(photos: UIImage(named: "s-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Norman", surname: "Vazovski", avatar: UIImage(named: "n-1"), photos:
                [Photo(photos: UIImage(named: "n-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-5"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Maurisio", surname: "Gonzales", avatar: UIImage(named: "m-1"), photos:
                [Photo(photos: UIImage(named: "m-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "m-5"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Pablo", surname: "Pablitos", avatar: UIImage(named: "p-1"), photos:
                [Photo(photos: UIImage(named: "p-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "p-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Yuki", surname: "Obayashi", avatar: UIImage(named: "y-1"), photos:
                [Photo(photos: UIImage(named: "y-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "y-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "June", surname: "Hobson", avatar: UIImage(named: "j-1"), photos:
                [Photo(photos: UIImage(named: "j-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "j-2"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Samanta", surname: "Majeta", avatar: UIImage(named: "s-1"), photos:
                [Photo(photos: UIImage(named: "s-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-5"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "s-6"), like: false, likeCount: 0, comentCount: 0)
                ]),
        Friend(name: "Norman", surname: "Vazovski", avatar: UIImage(named: "n-1"), photos:
                [Photo(photos: UIImage(named: "n-1"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-2"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-3"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-4"), like: false, likeCount: 0, comentCount: 0),
                 Photo(photos: UIImage(named: "n-5"), like: false, likeCount: 0, comentCount: 0)
                ])
    ]
    
    static func getSortedUsers(searchText: String?) -> [Character:[Friend]]{
        var tempUsers: [Friend]
        if let text = searchText?.lowercased(), searchText != "" {
            tempUsers = Friend.list.filter{ $0.name.lowercased().contains(text)}
        } else {
            tempUsers = Friend.list
        }
        let sortedUsers = Dictionary.init(grouping: tempUsers) { $0.name.lowercased().first! }
            .mapValues{ $0.sorted{ $0.name.lowercased() < $1.name.lowercased() } }
        return sortedUsers
    }
}
