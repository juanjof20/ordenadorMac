//
//  ViewController.swift
//  Cocoa-sideMenu
//
//  Created by A1-IMAC08 on 25/1/22.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var menuBT: UIBarButtonItem!
    @IBOutlet var rightBT: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureSideMenus()
    }
    
    func configureSideMenus()
    {
        if revealViewController() != nil
        {
            menuBT.target = revealViewController()
            menuBT.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
        
            rightBT.target = revealViewController()
            rightBT.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer((self.revealViewController().panGestureRecognizer()))
        }
    }
}
