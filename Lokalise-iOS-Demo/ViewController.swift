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
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let rootView = UIView()
    private let label = UILabel()
    private let button = UIButton()
    private let newVC = NewViewController()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupButton()
        self.view.addSubview(rootView)
        
        subscribeLokalise()
        
        label.text = NSLocalizedString("ota_key", comment: "")

        label.flex.markDirty()
        
        rootView.flex.direction(.column).justifyContent(.center).define { flex in
            flex.addItem(label).height(100).width(300).marginTop(300).marginLeft(50)
            flex.addItem(button).height(50).width(200).marginLeft(50)
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
        label.text = NSLocalizedString("ota_key", comment: "")
    }
    
    private func setupButton() {
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .blue
        button.rx.tap.bind { [self] _ in
            print("tappppped")
            self.navigationController?.pushViewController(newVC, animated: false)
        }
    }
}

