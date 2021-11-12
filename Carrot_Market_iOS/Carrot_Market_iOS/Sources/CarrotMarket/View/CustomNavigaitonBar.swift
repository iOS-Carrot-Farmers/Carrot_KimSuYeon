//
//  CustomNavigaitonBar.swift
//  Carrot_Market_iOS
//
//  Created by 김수연 on 2021/11/07.
//

import Foundation
import UIKit

class CustomNavigationBar: UIView {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
