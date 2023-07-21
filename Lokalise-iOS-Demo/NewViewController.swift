//
//  NewViewController.swift
//  Lokalise-iOS-Demo
//
//  Created by Chia Wei Zheng Terry on 21/7/23.
//

import UIKit
import FlexLayout
import PinLayout

class NewViewController: UIViewController {
    
    private let rootView = UIView()
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(rootView)
        
        label.text = NSLocalizedString("ota_key", comment: "")
        label.flex.markDirty()
        
        rootView.flex.direction(.column).justifyContent(.center).define { flex in
            flex.addItem(label).height(100).width(300).marginTop(300).marginLeft(50)
        }
        
        rootView.flex.layout()
    }
    
    override func viewWillLayoutSubviews() {
        rootView.pin.left().right().top().bottom()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
