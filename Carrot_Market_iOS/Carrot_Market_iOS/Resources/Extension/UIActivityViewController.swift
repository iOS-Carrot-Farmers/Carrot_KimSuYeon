//
//  UIActivityViewController.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/14.
//

import Foundation
import UIKit

extension UIViewController {
    func makeSharePanel() {
        let shareUrl = "https://www.daangn.com/articles/309202830"
        // 공유하고 싶은 것
        var shareObject = [Any]()
        
        shareObject.append(shareUrl)
    
        let activityViewController = UIActivityViewController(activityItems: shareObject, applicationActivities: nil)
        // sourceView는 뭐지 ?
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        // 공유기능시 제외하고 싶은 어플을 등록하는 방법
        //activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop,UIActivity.ActivityType.postToFacebook,UIActivity.ActivityType.postToTwitter,UIActivity.ActivityType.mail]
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}
