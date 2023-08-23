//
//  AlertService.swift
//  MovieTest
//
//  Created by Moez bachagha on 23/8/2023.
//

import Foundation
import UIKit

class AlertService {
    
    private init() {}
    static let shared = AlertService()
    

    
    func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create an "OK" action button
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // Add the action button to the alert controller
        alertController.addAction(okAction)
        
        // Present the alert controller
        viewController.present(alertController, animated: true, completion: nil)
    }
}
