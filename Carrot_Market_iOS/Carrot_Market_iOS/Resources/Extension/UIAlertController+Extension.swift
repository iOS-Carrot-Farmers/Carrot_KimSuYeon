//
//  UIAlertController+Extension.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/14.
//

import Foundation
import UIKit

extension UIViewController {
    func makeActionSheet(){
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let actionNotify = UIAlertAction(title: "신고", style: .default, handler: nil)
        let actionHide = UIAlertAction(title: "이 사용자의 글 보지 않기", style: .default, handler: nil)
        let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        actionSheetController.addAction(actionNotify)
        actionSheetController.addAction(actionHide)
        actionSheetController.addAction(actionCancel)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
}

