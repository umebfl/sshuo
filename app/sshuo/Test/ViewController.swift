////
////  ViewController.swift
////  sshuo
////
////  Created by ume on 2020/11/16.
////
//
//import UIKit
//
//class ViewController1: UIViewController {
//
//    @objc func switchClick(sw:UISwitch) {
//        if sw.isOn{
//            self.view.backgroundColor = UIColor.white
//        }else{
//            self.view.backgroundColor = UIColor.darkGray
//        }
//        
//        self.present(BasicUIScrollViewController(), animated:true, completion: nil)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    
//        let t = UITextView()
//        t.text = "22"
//        t.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//        t.backgroundColor = UIColor(displayP3Red: 200, green: 200, blue: 200, alpha: 1)
//
//        
//        self.view.addSubview(t)
//        
//         let mySwitch:UISwitch = UISwitch(frame: CGRect(x: 100, y: 100,  width: 100, height: 100))
//         //设置滑块颜色
//         mySwitch.thumbTintColor = UIColor.gray
//
//         //设置开关开启颜色
//         mySwitch.onTintColor = UIColor.green
//
//         //设置开关关闭颜色
//         mySwitch.tintColor = UIColor.white
//
//         //设置开关被使用的事件
//         //Selector参数可以通过#selector(方法名)这种方式调用一个方法
//         mySwitch.addTarget(self, action: #selector(switchClick), for: .valueChanged)
//        
//         self.view.addSubview(mySwitch)
//        
//        
//        let btn = UIButton()
//        btn.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
//        t.backgroundColor = UIColor(displayP3Red: 200, green: 200, blue: 200, alpha: 1)
//        btn.setTitle("按钮", for: UIControl.State.normal)
//        self.view.addSubview(btn)
//        
//        
//        
//    }
//
//
//}
//
