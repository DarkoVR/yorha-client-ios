//
//  AppDelegate.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/10/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController
        mainView?.viewControllers = [
            AutomataRouter.createModule(),
            BossRouter.createModule(),
            PodProgramRouter.createModule(),
            WeaponRouter.createModule()
        ]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
        
        return true
    }


    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "yorha_client_ios")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
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
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

