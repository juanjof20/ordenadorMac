//
//  AppDelegate.swift
//  pushJuanjo
//
//  Created by Juanjo
//

import UIKit

var messagesArray:[String] = []

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        self.registerForPushNotifications()
        let notificationOption = launchOptions?[.remoteNotification]
        
        // Comprueba que hay contenido en LunchOptions, en tal caso la app se ha lanzado desde la notificacion
        if let notification = notificationOption as? [String:AnyObject],
            let aps = notification["aps"] as? [String:AnyObject]
        {
            //Podemos manehar la notificaion
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
    {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func registerForPushNotifications()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {
            [weak self] granted, _ in
            print("Permission granted: \(granted)")
            guard granted else { return }
            self?.getNotificationSettings()
        }
    }
    
    // Si el usuario ha permitido las notificaciones llama a UIApplication.shared.registerForRemoteNotifications() para pedir el registro en el APNs, siempre desde el hilo principal.
    func getNotificationSettings()
    {
        UNUserNotificationCenter.current().getNotificationSettings
        {
            settings in
//            print("Configuracion push: \(settings)")
            
            guard settings.authorizationStatus == .authorized else { return }
            
            DispatchQueue.main.async
            {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    // Se ha completado el registro, recibimos el token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        let tokenParts = deviceToken.map {data in String(format: "%02.2hhx", data)}
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    // Si se produce un error durante el registro, llama a esta funcion
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)
    {
        print("Failed to register: \(error)")
    }
    
    // Recibir Notificaciones con la APP abierta
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        guard let aps = userInfo["aps"] as? [String: AnyObject] else
        {
            completionHandler(.failed)
            return
        }
        print("aps: \(aps)")
        
        let mensaje = aps["alert"]
        NotificationCenter.default.post(name: Notification.Name("notification"), object: nil, userInfo: ["mensaje":mensaje])
        messagesArray.append(mensaje as! String)
        //print(mensaje)
     }
}
