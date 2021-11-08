//
//  ItemTableViewCell.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/07.
//

import UIKit

class ItemTVC: UITableViewCell {
    static let identifier = "ItemTVC"

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(itemData: ItemData) {
        itemImageView.image = itemData.makeThumnailImage()
        itemNameLabel.text = itemData.itemName
        priceLabel.text = "\(itemData.itemPrice)원"
        descriptionLabel.text = "\(itemData.locationName) · \(itemData.uploadDate) 전"
        priceLabel.text = itemData.itemPrice
        likeNumberLabel.text = "\(itemData.likeNumber)"
    }
    
    
}

extension ItemTVC {
    func setUI(){
        itemImageView.layer.cornerRadius = 7
        itemImageView.contentMode = .scaleToFill
        itemNameLabel.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        
        descriptionLabel.textColor = UIColor(red: 0.573, green: 0.588, blue: 0.616, alpha: 1)
        descriptionLabel.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        priceLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        likeNumberLabel.textColor = UIColor(red: 0.375, green: 0.375, blue: 0.375, alpha: 1)
        likeNumberLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
    }
}
