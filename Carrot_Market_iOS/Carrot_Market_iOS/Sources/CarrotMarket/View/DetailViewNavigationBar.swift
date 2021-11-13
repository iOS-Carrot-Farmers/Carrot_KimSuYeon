//
//  DetailViewNavigationBar.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/11.
//

import Foundation
import UIKit

class DetailViewNavigationBar: UIView {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        presentToHomeViewController()
    }
    @IBAction func menuButtonDidTap(_ sender: Any) {
        presentNotifyAction()
    }
    @IBAction func shareButton(_ sender: Any) {
        presentSharePanel()
    }
}

extension DetailViewNavigationBar {
    private func presentToHomeViewController() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TouchBackButton"), object: nil)
    }
    private func presentNotifyAction() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TouchMenuButton"), object: nil)
    }
    private func presentSharePanel() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TouchShareButton"), object: nil)
    }
}
