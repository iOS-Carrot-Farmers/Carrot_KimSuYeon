//
//  HomeVC.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/03.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var customNavigationBar: UIView!
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var plusButton: UIButton!
    
    var itemList: [ItemData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        initDataList()
        setTableView()
        setPlusButton()
    }
    
    func initDataList(){
        itemList.append(contentsOf: [
            ItemData(thumnailImageName: "photo", itemName: "킹받아요 인생네컷", locationName: "성신여대", uploadDate: "30초", itemPrice: "4,000원", likeNumber: 5),
            ItemData(thumnailImageName: "applewatch", itemName: "애플워치 3세대", locationName: "상일동", uploadDate: "5분", itemPrice: "100,000원", likeNumber: 4),
            ItemData(thumnailImageName: "book", itemName: "이코테 파이썬 책", locationName: "천호동", uploadDate: "3시간", itemPrice: "10,000원", likeNumber: 9),
            ItemData(thumnailImageName: "ikea", itemName: "이케아 코끼리 인형", locationName: "수서동", uploadDate: "17시간", itemPrice: "8,000원", likeNumber: 1),
            ItemData(thumnailImageName: "airpod", itemName: "에어팟 프로 케이스", locationName: "풍산동", uploadDate: "1일", itemPrice: "7,000원", likeNumber: 3)
        ])
    }
    
    func setTableView(){
        itemTableView.dataSource = self
        itemTableView.delegate = self
        
        let itemXib = UINib(nibName: ItemTVC.identifier , bundle: nil)
        itemTableView.register(itemXib, forCellReuseIdentifier: ItemTVC.identifier )
    }
    
    func setPlusButton(){
//        let plusButton = UIButton()
//
//        plusButton.setImage(UIImage(named: "plusButton"), for: .normal)
//        view.addSubview(plusButton)
        self.view.bringSubviewToFront(plusButton)
//
//        plusButton.translatesAutoresizingMaskIntoConstraints = false
//        plusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 303).isActive = true
//        plusButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 659).isActive = true
//        plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100).isActive = true
//        plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 17 ).isActive = true
    }
}

extension HomeVC {
    private func initNavigationBar() {
        guard let loadedNib = Bundle.main.loadNibNamed(String(describing: CustomNavigationBar.self), owner: self, options: nil) else { return }
        guard let navigationBar = loadedNib.first as? CustomNavigationBar else { return }
        
        navigationBar.frame = CGRect(x: 0, y: 0, width: customNavigationBar.frame.width, height: customNavigationBar.frame.height)
        customNavigationBar.addSubview(navigationBar)
        
        navigationBar.locationLabel.text = "상일동"
        navigationBar.locationLabel.textAlignment = .center
        navigationBar.locationLabel.sizeToFit()
    }
}

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTVC.identifier) as? ItemTVC else {return UITableViewCell()}
        
        cell.setData(itemData: itemList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 셀 선택 해제 
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "ItemDetailVC") as? ItemDetailVC else { return }
 
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        
        // 셀 선택 시 데이터 전달
        detailVC.itemList = itemList[indexPath.row]
        
        self.present(detailVC, animated: true, completion: nil)
        //self.navigaitonController?.pushViewController(detailVC, animated: true)
    }
    
}
