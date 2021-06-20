//
//  News.swift
//  VK app
//
//  Created by Maxim Bekmetov on 18.05.2021.
//

import UIKit

struct News {
    
    let avatar: UIImage?
    let title: String
    let date: String
    let photo: [Photo]
    
    static var list : [News] = [
        News(avatar: UIImage(named: "g-1"), title: "На Чукотке участкового заподозрили в удержании людей в самодельной клетке", date: "20.5.2020", photo: [Photo(photos: UIImage(named: "news-1"), like: true, likeCount: 10, comentCount: 10)]),
        News(avatar: UIImage(named: "g-2"), title: "Полиция проверит действия участкового, проигнорировавшего вызов девочки", date: "20.5.2020", photo: [Photo(photos: UIImage(named: "news-2"), like: true, likeCount: 10, comentCount: 10)]),
        News(avatar: UIImage(named: "g-1"), title: "Полиция в Приморье проверит, применяли ли силу к ребенку в детсаду", date: "20.5.2020", photo: [Photo(photos: UIImage(named: "news-3"), like: true, likeCount: 10, comentCount: 10)]),
        News(avatar: UIImage(named: "g-2"), title: "Жителя Свердловской области обвинили в убийстве сына из-за плача", date: "20.5.2020", photo: [Photo(photos: UIImage(named: "news-4"), like: true, likeCount: 10, comentCount: 10)]),
        News(avatar: UIImage(named: "g-1"), title: "В Ленинградской области ребенок получил ранение в шею на детской площадке", date: "20.5.2020", photo: [Photo(photos: UIImage(named: "news-5"), like: true, likeCount: 10, comentCount: 10)]),
        News(avatar: UIImage(named: "g-3"), title: "В Астрахани ребенок сломал семь позвонков, упав на лестничной площадке", date: "20.5.2020", photo: [Photo(photos: UIImage(named: "news-6"), like: true, likeCount: 10, comentCount: 10)]),
    ]
}
