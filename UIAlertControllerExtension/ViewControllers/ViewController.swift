//
//  ViewController.swift
//  UIAlertControllerExtension
//
//  Created by Sergey Krasiuk on 31/01/2020.
//  Copyright © 2020 Sergey Krasiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Alertable {
    
    enum Operations: ActionRepresentable {
        
        case AddNew
        case DeleteAll
        
        var rawValue: (title: String, style: UIAlertAction.Style) {
            get {
                switch self {
                case .AddNew:
                    return ("AddNew", .default)
                case .DeleteAll:
                    return ("DeleteAll", .destructive)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.showAlert(title: "Title", message: "Message", style: .alert, actions: Operations.self) { (action) in
            
            switch action {
            case .AddNew:
                print("Pressed .AddNew")
            case .DeleteAll:
                print("Pressed .DeleteAll")
            }
        }
    }
}

