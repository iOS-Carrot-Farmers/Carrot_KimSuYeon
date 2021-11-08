//
//  ItemDetailVC.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/07.
//

import UIKit

class ItemDetailVC: UIViewController {

    var itemName: String?
    var uploadDate : String?
    var locationName : String?
    var itemPrice : String?
    var likeNumber : Int?

    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mannerTempLabel: UILabel!
    @IBOutlet weak var mannerTempBar: UIProgressView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var postNotifyLabel: UILabel!
    @IBOutlet weak var sellListCollectionView: UICollectionView!
    
    @IBOutlet weak var itemContentLabel: UILabel!
    
    var images = [#imageLiteral(resourceName: "photo") , #imageLiteral(resourceName: "applewatch") , #imageLiteral(resourceName: "airpod") , #imageLiteral(resourceName: "book") , #imageLiteral(resourceName: "ikea") ]
    var imageViews = [UIImageView]()
    
    
    @IBOutlet weak var itemScrollView: UIScrollView!
    @IBOutlet weak var itemPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemScrollView.delegate = self
        addContentScrollView()
        setPageControl()
        setDataLabel()
    }
    
}

extension ItemDetailVC: UIScrollViewDelegate {
    private func addContentScrollView() {
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: itemScrollView.bounds.width, height: itemScrollView.bounds.height)
            imageView.image = images[i]
            itemScrollView.addSubview(imageView)
            itemScrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
        
    }
    
    private func setPageControl() {
        itemPageControl.numberOfPages = images.count
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        itemPageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}

// data 모델로 바꾸기..
extension ItemDetailVC {
    func setDataLabel() {
        userNameLabel.text = "쿠리보"
        userNameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 15)
        
        mannerTempLabel.text = "40.9°C"
        mannerTempLabel.textColor = UIColor(red: 0.22, green: 0.698, blue: 0.302, alpha: 1)

        mannerTempLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        
        if let item = itemName {
            itemNameLabel.text = item
            itemNameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

            itemNameLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 18)
            itemNameLabel.sizeToFit()
        }
        if let date = uploadDate {
            descriptionLabel.text = "생활가전 · \(date) 전"
            descriptionLabel.textColor = UIColor(red: 0.529, green: 0.545, blue: 0.576, alpha: 1)

            descriptionLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
            descriptionLabel.sizeToFit()
        }
        if let location = locationName {
            locationLabel.text = location
            locationLabel.textColor = UIColor(red: 0.302, green: 0.318, blue: 0.345, alpha: 1)
            locationLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
            locationLabel.sizeToFit()
        }
//        if let price = itemPrice {
//            itemPriceLabel.text = price
//            itemPriceLabel.sizeToFit()
//        }
        if let like = likeNumber {
            likeNumberLabel.text = "관심 \(like) · 조회 57"
            likeNumberLabel.textColor = UIColor(red: 0.529, green: 0.545, blue: 0.576, alpha: 1)

            likeNumberLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
            likeNumberLabel.sizeToFit()
        }
        
        itemContentLabel.text = "배터리 두개에요 쿠리보가 직접 거래해요 !"
        itemContentLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

        itemContentLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        
        postNotifyLabel.text = " 이 게시글 신고하기"
        postNotifyLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

        postNotifyLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
    }
}
