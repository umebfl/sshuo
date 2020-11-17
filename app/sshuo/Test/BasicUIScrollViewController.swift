//
//  BasicUIScrollViewController.swift
//  SnapKit
//
//  Created by Spiros Gerokostas on 01/03/16.
//  Copyright © 2016 SnapKit Team. All rights reserved.
//

import UIKit
//import SnapKit

//class BasicUIScrollViewController: UIViewController {
//    
//    var didSetupConstraints = false
//    
//    let scrollView  = UIScrollView()
//    let contentView = UIView()
//    
//    let label: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .blue
//        label.numberOfLines = 0
//        label.lineBreakMode = .byClipping
//        label.textColor = .white
//        label.text = NSLocalizeim id est laborum.", comment: "")
//        return label
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = UIColor.white
//        
//        view.addSubview(scrollView)
//        
//        contentView.backgroundColor = UIColor.lightGray
//        scrollView.addSubview(contentView)
//        contentView.addSubview(label)
//        
//        view.setNeedsUpdateConstraints()
//    }
//    
//    override func updateViewConstraints() {
//        
//        if (!didSetupConstraints) {
//            
//            scrollView.snp.makeConstraints { make in
//                make.edges.equalTo(view).inset(UIEdgeInsets.zero)
//            }
//            
//            contentView.snp.makeConstraints { make in
//                make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
//                make.width.equalTo(scrollView)
//            }
//            
//            label.snp.makeConstraints { make in
//                make.top.equalTo(contentView).inset(20)
//                make.leading.equalTo(contentView).inset(20)
//                make.trailing.equalTo(contentView).inset(20)
//                make.bottom.equalTo(contentView).inset(20)
//            }
//            
//            didSetupConstraints = true
//        }
//        
//        super.updateViewConstraints()
//    }
//}
