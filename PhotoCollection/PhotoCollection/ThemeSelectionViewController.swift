//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    // MARK: - Properties
    var themeHelper: ThemeHelper?
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    // Make background grey
    @IBAction func selectDarkTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // Make background purple
    @IBAction func selectPurpleTheme(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToPurple()
         self.navigationController?.popToRootViewController(animated: true)
    }
}
