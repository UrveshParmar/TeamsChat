//
//  ChatUIConfiguration.swift
//  TeamsChat
//
//  Created by Ronak Sankhala on 07/12/22.
//

import UIKit

class ChatUIConfiguration: TeamsChatUIGenericConfigurationProtocol {
    let statusBarStyle: UIStatusBarStyle = .default
    
    let regularSmallFont = UIFont.systemFont(ofSize: 14)
    let regularMediumFont = UIFont.systemFont(ofSize: 17)
    let regularLargeFont = UIFont.systemFont(ofSize: 23)
    let mediumBoldFont = UIFont.boldSystemFont(ofSize: 17)
    let boldLargeFont = UIFont.boldSystemFont(ofSize: 23)
    let boldSmallFont = UIFont.boldSystemFont(ofSize: 14)
    let boldSuperSmallFont = UIFont.boldSystemFont(ofSize: 11)
    let boldSuperLargeFont = UIFont.boldSystemFont(ofSize: 29)

    let italicMediumFont = UIFont.italicSystemFont(ofSize: 17)

    func regularFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    func configureUI() {
        UITabBar.appearance().barTintColor = UIColor(named: "mainThemeBackgroundColor")
        UITabBar.appearance().tintColor = UIColor(named: "mainThemeForegroundColor")
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "mainTextColor")
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor(named: "mainTextColor") ?? .black,
                                                          .font: self.boldSuperSmallFont],
                                                         for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor(named: "mainThemeForegroundColor") ?? .white,
                                                          .font: self.boldSuperSmallFont],
                                                         for: .selected)

        UITabBar.appearance().backgroundImage = UIImage.colorForNavBar(UIColor(named: "mainThemeBackgroundColor") ?? .white)
        UITabBar.appearance().shadowImage = UIImage.colorForNavBar(UIColor(named: "hairlineColor") ?? .lightGray)

        UINavigationBar.appearance().barTintColor = UIColor(named: "mainThemeBackgroundColor")
        UINavigationBar.appearance().tintColor = UIColor(named: "mainThemeForegroundColor")
    }
}
