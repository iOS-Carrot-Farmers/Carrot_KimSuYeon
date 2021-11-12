//
//  ItemDataModel.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/07.
//

import UIKit

struct ItemData{
    let thumnailImageName: String
    let itemName: String
    let locationName: String
    
    let uploadDate: String
    let itemPrice: String
    let likeNumber: Int
    
    func makeThumnailImage() -> UIImage? {
        return UIImage(named: thumnailImageName)
    }
}

struct SellItemData{
    let thumnailImageName: String
    let itemName: String
    let itemPrice: String
    
    func makeThumnailImage() -> UIImage? {
        return UIImage(named: thumnailImageName)
    }
}
