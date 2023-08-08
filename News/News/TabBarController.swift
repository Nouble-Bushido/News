//
//  TabBarController.swift
//  News
//
//  Created by Артем Чжен on 08.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        viewControllers = [
            let navigationController = UINavigationController(rootViewController: <#T##UIViewController#>)
        ]
    }
}
