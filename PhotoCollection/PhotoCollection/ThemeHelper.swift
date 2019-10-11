//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Christy Hicks on 10/10/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation

class ThemeHelper{
    
  // MARK: - Init Method

  init() {
      if themePreference == nil {
          setThemePreferenceToDark()
      }
  }
    
    //MARK: Properties
    static var themePreferenceKey = "themePreferenceKey"
    
    //here we created a theme preference. it changes the value for the key we have specified. (its a dictionary correct?)
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: ThemeHelper.themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Purple", forKey: ThemeHelper.themePreferenceKey)
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: ThemeHelper.themePreferenceKey)
    }

}
