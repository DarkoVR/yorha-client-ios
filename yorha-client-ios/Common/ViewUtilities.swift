//
//  ViewUtilities.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

var vSpinner: UIView?

func alertMessage(onViewController: UIViewController, title: String? = "Title", message: String? = "Message"){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        switch action.style{
        case .cancel: print("cancel")
        case .destructive: print("destructive")
        default: print("default")
        }
    }))
    DispatchQueue.main.async {
        onViewController.present(alert, animated: true, completion: nil)
    }
}

func startLoading(onView: UIView) {
    let spinnerView = UIView.init(frame: onView.bounds)
    spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    let ai = UIActivityIndicatorView.init(style: .whiteLarge)
    ai.startAnimating()
    ai.center = spinnerView.center
    
    DispatchQueue.main.async {
        spinnerView.addSubview(ai)
        onView.addSubview(spinnerView)
    }
    
    vSpinner = spinnerView
}

func stopLoading() {
    DispatchQueue.main.async {
        vSpinner?.removeFromSuperview()
        vSpinner = nil
    }
}
