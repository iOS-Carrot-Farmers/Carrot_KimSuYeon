//
//  SellListCVC.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/08.
//

import UIKit

class SellListCVC: UICollectionViewCell {
    static let identifier = "SellListCVC"

    @IBOutlet weak var sellListImage: UIImageView!
    @IBOutlet weak var sellListItemName: UILabel!
    @IBOutlet weak var sellListItemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setData(sellData: SellItemData){
        sellListImage.image = sellData.makeThumnailImage()
        sellListItemName.text = sellData.itemName
        sellListItemPrice.text = sellData.itemPrice
    }
    
    func setUI(){
        sellListImage.layer.cornerRadius = 8
        sellListItemName.font = UIFont(name: "SFProDisplay-Medium", size: 13)
        sellListItemPrice.font = UIFont(name: "SFProDisplay-Bold", size: 13)
    }

}

extension ItemDetailVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SellListCVC.identifier, for: indexPath) as? SellListCVC else { return UICollectionViewCell()}
        
        cell.setData(sellData: sellList[indexPath.row])
        return cell
    }
    // collection view header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableView", for: indexPath)
            return headerView
        default: assert(false, "Don't use this kind")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 60
        return CGSize(width: width, height: height)
    }
}

extension ItemDetailVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 169)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
