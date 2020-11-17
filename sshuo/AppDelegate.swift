//
//  AppDelegate.swift
//  sshuo
//
//  Created by ume on 2020/11/16.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        self.window = UIWindow.init(frame: UIScreen.main.bounds)
//        self.window?.backgroundColor = UIColor.red
//

//

//
//        let tabBarController = UITabBarController()
//
//        tabBarController.viewControllers = list
//
//        self.window?.rootViewController = tabBarController
//
//        self.window!.makeKeyAndVisible()
//
//        return true
        
        
        
        
//         self.window = UIWindow.init(frame: UIScreen.main.bounds)
//         self.window?.backgroundColor = UIColor.red
//
//         let home = Account()
//         let HomeNC = UINavigationController.init(rootViewController: home)
//
//         // 改变图片 保证图片不失真
//         let homeImage = UIImage(named:images[0])?.withRenderingMode(.alwaysOriginal)
//         let homeSelectImage = UIImage(named:selectedImages[0])?.withRenderingMode(.alwaysOriginal)
//
//         HomeNC.tabBarItem = UITabBarItem.init(title: "首页", image: homeImage, selectedImage: homeSelectImage)
//
//
//         let center = Square()
//         let CenterNC = UINavigationController.init(rootViewController: center)
//
//         // 改变图片 保证图片不失真
//         let centerImage = UIImage(named:images[1])?.withRenderingMode(.alwaysOriginal)
//         let centerSelectImage = UIImage(named:selectedImages[1])?.withRenderingMode(.alwaysOriginal)
//
//         CenterNC.tabBarItem = UITabBarItem.init(title: "个人中心", image: centerImage, selectedImage: centerSelectImage)
//         // 下表数值显示
//         CenterNC.tabBarItem.badgeValue = "10"
//
//         let more = Analy()
//         let MoreNC = UINavigationController.init(rootViewController: more)
//
//         // 改变图片 保证图片不失真
//         let moreImage = UIImage(named:images[2])?.withRenderingMode(.alwaysOriginal)
//         let moreSelectImage = UIImage(named:selectedImages[2])?.withRenderingMode(.alwaysOriginal)
//
//         MoreNC.tabBarItem = UITabBarItem.init(title: "更多", image: moreImage, selectedImage: moreSelectImage)
//
//         let navArray = [HomeNC, CenterNC, MoreNC]
//         let tabBarController = UITabBarController()
//         tabBarController.viewControllers = navArray
//
//         self.window?.rootViewController = tabBarController
//         self.window?.makeKeyAndVisible()
//
//         return true
        
        

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "sshuo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

