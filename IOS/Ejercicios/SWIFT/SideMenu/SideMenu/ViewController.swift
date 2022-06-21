//
//  ViewController.swift
//  SideMenu
//
//  Created by A1-IMAC08 on 1/2/22.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var hola: UIBarButtonItem!
    @IBOutlet var menuBT: UIBarButtonItem!
    //    @IBOutlet var rightBT: UIBarButtonItem!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        webView?.navigationDelegate = self
//        webView?.uiDelegate = self
        self.configureSideMenus()
        
//        let url = URL(string: "http:/escuelaestech.es")!
//        let request = URLRequest(url: url)
//        webView?.load(request)
    }

    func configureSideMenus()
    {
        if revealViewController() != nil
        {
            hola.target = revealViewController()
            hola.action = #selector(SWRevealViewController.revealToggle(_:))
//            rightBT.target = revealViewController()
//            rightBT.action = #selector(SWRevealViewController.rightRevealToggle(_:))

            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
//        if revealViewController() != nil
//        {
//            menuBT.target = self.revealViewController()
//            menuBT.action = #selector(SWRevealViewController.revealToggle(_:))
//            rightBT.target = self.revealViewController()
//            rightBT.action = #selector(SWRevealViewController.revealToggle(_:))
//            self.revealViewController().rearViewRevealWidth = 275
//            self.revealViewController().rightViewRevealWidth = 160
//
//            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
//        }
    }
    
///PREGUNTAS (mirar notas de apple)
//////////////////////////////////////////////////////////
}
