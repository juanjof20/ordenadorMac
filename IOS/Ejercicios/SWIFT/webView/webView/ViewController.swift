//
//  ViewController.swift
//  webView
//
//  Created by A1-IMAC08 on 25/1/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate
{
    @IBOutlet var webView: WKWebView!
    @IBOutlet var barraDirecciones: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        let url = URL(string: "https://google.es")!
        let request = URLRequest(url: url)
        webView.load(request)
        
        // Para los gestos desde el borde de la pantalla para ir atras
        webView.allowsBackForwardNavigationGestures = true
    }
    // ESto es si queremos que el webView ocupe la pantalla completa, si vamos aponer botones vamos
//    override func loadView()
//    {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//        webView.uiDelegate = self
//        view = webView
//    }
    
    @IBAction func backBTPRSS(_ sender: Any)
    {
        if webView.canGoBack
        {
            webView.goBack()
        }
    }
    
    @IBAction func fordBTPRSS(_ sender: Any)
    {
        if webView.canGoForward
        {
            webView.goForward()
        }
    }
    
    @IBAction func refreshBTPRSS(_ sender: Any)
    {
        webView.reload()
    }
    
    @IBAction func goBTPRSS(_ sender: Any)
    {
        if let direccion =  barraDirecciones.text
        {
            let url = URL(string: direccion)
            if (url != nil)
            {
                webView.load(URLRequest(url: url!))
            }
            barraDirecciones.text = ""
        }
    }
}
