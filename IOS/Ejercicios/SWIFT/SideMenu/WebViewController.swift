//
//  WebViewController.swift
//  SideMenu
//
//  Created by A1-IMAC08 on 9/2/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate
{
    @IBOutlet var menu: UINavigationItem!
    
    @IBOutlet var webView: WKWebView!
        @IBAction func atrasBT(_ sender: Any) {if webView.canGoBack{webView.goBack()}}
        @IBAction func recargarBT(_ sender: Any) {webView?.reload()}
        @IBAction func avanzarBT(_ sender: Any) {if webView.canGoForward{webView.goForward()}}
    
        @IBOutlet var buscadorTF: UITextField!
        @IBAction func buscarBT(_ sender: Any)
        {
            if let direccion =  buscadorTF.text
            {
                let url = URL(string: direccion)
                if (url != nil)
                {
                    webView.load(URLRequest(url: url!))
                }
                buscadorTF.text = ""
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
        //webView.allowsBackForwardNavigationGestures = true
    }
 
}
