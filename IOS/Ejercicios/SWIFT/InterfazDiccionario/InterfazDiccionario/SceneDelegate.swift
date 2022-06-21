//
//  SceneDelegate.swift
//  InterfazDiccionario
//
//  Created by A1-IMAC08 on 12/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
    var window: UIWindow?

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>)
    {
        if let url = URLContexts.first?.url
        {
            let message = url.host?.removingPercentEncoding
            let storyboard1 = UIStoryboard(name: "Main", bundle: nil)
            let vc1 = storyboard1.instantiateViewController(withIdentifier: "primerVC") as! ViewController
            vc1.message =  message ?? ""
            let rootVC = self.window!.rootViewController as! UINavigationController
            rootVC.show(vc1, sender: nil)
        }
    }
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {guard let _ = (scene as? UIWindowScene) else { return } }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
