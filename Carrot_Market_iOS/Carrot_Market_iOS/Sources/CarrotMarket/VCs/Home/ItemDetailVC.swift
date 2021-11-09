//
//  ItemDetailVC.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/07.
//

import UIKit

class ItemDetailVC: UIViewController {

    // 데이터 전달
    var itemList: ItemData?

    // 상단 스크롤뷰
    @IBOutlet weak var itemScrollView: UIScrollView!
    @IBOutlet weak var itemPageControl: UIPageControl!
    
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mannerTempLabel: UILabel!
    @IBOutlet weak var mannerTempBar: UIProgressView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var uploadContentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var postNotifyLabel: UILabel!
    @IBOutlet weak var sellListCollectionView: UICollectionView!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var priceSuggestLabel: UILabel!

   
    var images = [#imageLiteral(resourceName: "photo") , #imageLiteral(resourceName: "applewatch") , #imageLiteral(resourceName: "airpod") , #imageLiteral(resourceName: "book") , #imageLiteral(resourceName: "ikea") ]
    var imageViews = [UIImageView]()
    
    var sellList: [SellItemData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemScrollView.delegate = self
        addContentScrollView()
        setPageControl()
        setDataLabel()
        
        initCollectionViewData()
        collectionViewDelegate()
        registerCollectionView()
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
        self.view.bringSubviewToFront(itemPageControl)
        
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
        
        if let item = itemList?.itemName {
            itemNameLabel.text = item
            itemNameLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

            itemNameLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 18)
            itemNameLabel.sizeToFit()
        }
        if let date = itemList?.uploadDate {
            uploadContentLabel.text = "생활가전 · \(date) 전"
            uploadContentLabel.textColor = UIColor(red: 0.529, green: 0.545, blue: 0.576, alpha: 1)

            uploadContentLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
            uploadContentLabel.sizeToFit()
        }
        if let location = itemList?.locationName {
            locationLabel.text = location
            locationLabel.textColor = UIColor(red: 0.302, green: 0.318, blue: 0.345, alpha: 1)
            locationLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
            locationLabel.sizeToFit()
        }
        if let price = itemList?.itemPrice {
            itemPriceLabel.text = price
            itemPriceLabel.sizeToFit()
            itemPriceLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        }
        if let like = itemList?.likeNumber {
            likeNumberLabel.text = "관심 \(like) · 조회 57"
            likeNumberLabel.textColor = UIColor(red: 0.529, green: 0.545, blue: 0.576, alpha: 1)

            likeNumberLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
            likeNumberLabel.sizeToFit()
        }
        
        descriptionLabel.text = """
        배터리 두개에요 쿠리보가 직접 거래해요 ! 배터리 두개에요 쿠리보가 직접 거래해요 !
        
        쿨거 하시면 래원의 느린 심   장 박동 실시간으로 들려드립니다.
        """
        descriptionLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

        descriptionLabel.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        
        postNotifyLabel.text = " 이 게시글 신고하기"
        postNotifyLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

        postNotifyLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
        
        
        
        priceSuggestLabel.textColor = UIColor(red: 0.633, green: 0.633, blue: 0.633, alpha: 1)

        priceSuggestLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 11)

    }
}

// collectionview 설정해주기

extension ItemDetailVC {
    func initCollectionViewData() {
        sellList.append(contentsOf: [
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원"),
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원"),
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원"),
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원"),
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원"),
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원"),
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원"),
            SellItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", itemPrice: "5,000원")
            
        ])
    }
    
    func collectionViewDelegate(){
        sellListCollectionView.dataSource = self
        sellListCollectionView.delegate = self
    }
    
    func registerCollectionView(){
        let sellXib = UINib(nibName: SellListCVC.identifier, bundle: nil)
        sellListCollectionView.register(sellXib, forCellWithReuseIdentifier: SellListCVC.identifier)
    }
}
