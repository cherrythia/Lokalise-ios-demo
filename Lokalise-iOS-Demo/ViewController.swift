//
//  ViewController.swift
//  Lokalise-iOS-Demo
//
//  Created by Chia Wei Zheng Terry on 20/2/23.
//

import UIKit
import FlexLayout
import PinLayout
import Lokalise

class ViewController: UIViewController {
    
    private let rootView = UIView()
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(rootView)
        
        subscribeLokalise()
        
        label.text = NSLocalizedString("testing_r3_label_copy", comment: "")
        //        label.text = Lokalise.shared.localizedString(forKey: "estatement_cashline_label", value: "default", table: nil)

        label.flex.markDirty()
        
        rootView.flex.direction(.column).justifyContent(.center).define { flex in
            flex.addItem(label).height(100).width(300).marginTop(300).marginLeft(50)
        }
        
        rootView.flex.layout()
    }
    
    override func viewWillLayoutSubviews() {
        rootView.pin.left().right().top().bottom()
    }
    
    private func subscribeLokalise() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateUserInterface),
            name: NSNotification.Name.LokaliseDidUpdateLocalization,
            object: nil
        )
    }
    
    @objc func updateUserInterface() {
        // Update your interface in Swift
//        label.text = Lokalise.shared.localizedString(forKey: "estatement_cashline_label", value: "default value", table: "tableName")
        print("Downloaded")
    }


}

