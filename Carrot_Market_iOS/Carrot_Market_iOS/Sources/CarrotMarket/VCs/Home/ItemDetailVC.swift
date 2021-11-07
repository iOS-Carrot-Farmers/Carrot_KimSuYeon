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
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var uploadDateLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    
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

extension ItemDetailVC {
    func setDataLabel() {
        if let item = itemName {
            itemNameLabel.text = item
            itemNameLabel.sizeToFit()
        }
        if let date = uploadDate {
            uploadDateLabel.text = "\(date) 전"
            uploadDateLabel.sizeToFit()
        }
        if let location = locationName {
            locationLabel.text = location
            locationLabel.sizeToFit()
        }
        if let price = itemPrice {
            itemPriceLabel.text = price
            itemPriceLabel.sizeToFit()
        }
        if let like = likeNumber {
            likeNumberLabel.text = "관심 \(like)"
            likeNumberLabel.sizeToFit()
        }
    }
}
