//
//  LanguageManager.swift
//  MOEStudents
//
//  Created by Sergey Krasiuk on 28/05/2017.
//  Copyright © 2017 IdeoDigital. All rights reserved.
//

import UIKit

extension Localize {
    
    // MARK: Localize library extension
    
    func setLayout(direction: UISemanticContentAttribute, `for` controls: [UIView]) {
        
        controls.forEach { (view) in
            view.semanticContentAttribute = direction
        }
    }
    
    open class func isRTLDirection(language: String) -> Bool {
        return Locale.characterDirection(forLanguage: language) == .leftToRight ? false : true
    }
    
    // After change language, we check lang direction and rotate if needed
    
    open class func reloadRootController() {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.reloadRootViewController(with: BaseViewController()/*.instantiateFromStoryboard(applicationStoryboard: .Main)*/)
    }
    
    open class func isDirectionRightToLeft() -> Bool {
        return Localize.isRTLDirection(language: Localize.currentLanguage())
    }
}
