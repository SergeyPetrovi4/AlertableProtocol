//
//  AlertableProtocol.swift
//  AlertableProtocol
//
//  Created by Sergey Krasiuk on 31/01/2020.
//  Copyright © 2020 Sergey Krasiuk. All rights reserved.
//

import Foundation
import UIKit

protocol ActionRepresentable: CaseIterable  {
    var rawValue: (title: String, style: UIAlertAction.Style) { get }
}

protocol Alertable where Self: UIViewController {
    
    func showAlert<T: ActionRepresentable>(title: String?, message: String?, style: UIAlertController.Style, actions: T.Type, completion: ((T) -> Void)?)
}

extension Alertable {
    
    func showAlert<T: ActionRepresentable>(title: String?, message: String?, style: UIAlertController.Style, actions: T.Type, completion: ((T) -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
                
        actions.allCases.enumerated().forEach({
            let actionElement = $0.element
            let action = UIAlertAction(title: $0.element.rawValue.title, style: $0.element.rawValue.style) { _ in
                completion?(actionElement)
            }

            alertController.addAction(action)
        })
                
        self.present(alertController, animated: true, completion: nil)
    }
}
