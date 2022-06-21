//
//  WebViewController.swift
//  SideMenuMapa
//
//  Created by A1-IMAC08 on 9/2/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate
{
    @IBOutlet var menuBT: UIBarButtonItem!
    @IBOutlet var rightBT: UIBarButtonItem!
    @IBOutlet var webView: WKWebView!
    
    @IBAction func backBT(_ sender: Any)
    {
        if webView.canGoBack{webView.goBack()}
    }
    
    @IBAction func reloadBT(_ sender: Any)
    {
        webView?.reload()
    }
    
    @IBAction func nextBT(_ sender: Any)
    {
        if webView.canGoForward{webView.goForward()}
    }

    @IBOutlet var searchTF: UITextField!
    @IBAction func searchBT(_ sender: Any)
    {
        if let direccion =  searchTF.text
        {
            if direccion.hasPrefix("https://")
            {
                let url = URL(string: direccion)
                if (url != nil)
                {
                    webView.load(URLRequest(url: url!))
                }
                searchTF.text = ""
            } else
            {
                let url = URL(string: "https://\(direccion)")
                if (url != nil)
                {
                    webView.load(URLRequest(url: url!))
                }
                searchTF.text = ""
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        let url = URL(string: "https://escuelaestech.es")!
        let request = URLRequest(url: url)
        webView?.load(request)
        self.configureSideMenus()
    }

    func configureSideMenus()
    {
        if revealViewController() != nil
        {
            menuBT.target = revealViewController()
            menuBT.action = #selector(SWRevealViewController.revealToggle(_:))
            rightBT.target = revealViewController()
            rightBT.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
        }
    }
}
