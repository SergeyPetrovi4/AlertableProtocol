//
//  SecondViewController.swift
//  UIAlertControllerExtension
//
//  Created by Sergey Krasiuk on 07/02/2020.
//  Copyright © 2020 Sergey Krasiuk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, Alertable {
    
    enum PhotoOperations: ActionRepresentable {
        
        case getGalleryPermissions
        case getCameraPermissions
        case uploadPhotos
        case cancel
        
        var rawValue: (title: String, style: UIAlertAction.Style) {
            get {
                switch self {
                case .getGalleryPermissions:
                    return ("getGalleryPermissions", .default)
                case .getCameraPermissions:
                    return ("getCameraPermissions", .default)
                case .uploadPhotos:
                    return ("uploadPhotos", .default)
                case .cancel:
                    return ("cancel", .cancel)
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
        
        self.showAlert(title: "Title", message: "Message", style: .actionSheet, actions: PhotoOperations.self) { (action) in
            
            switch action {
            case .getGalleryPermissions:
                print("Pressed .getGalleryPermissions")
            case .uploadPhotos:
                print("Pressed .uploadPhotos")
            case .getCameraPermissions:
                print("Pressed .getCameraPermissions")
            case .cancel:
                print("Pressed .cancel")
            }
        }
    }

}
