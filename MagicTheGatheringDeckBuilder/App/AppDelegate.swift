//
//  AppDelegate.swift
//  MagicTheGatheringDeckBuilder
//
//  Created by alexis gauthier on 29/08/18.
//  Copyright © 2018 alexis gauthier. All rights reserved.
//

import UIKit
import CoreLocation
import RealmSwift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    var window: UIWindow?
    let locationmanager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.requestAlwaysAuthorization()
        locationmanager.delegate = self
        locationmanager.startUpdatingLocation()
        FirebaseApp.configure()
        let config = Realm.Configuration(
            schemaVersion: 5,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                }
        })
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else{
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name.deviceLocationUpdated, object: nil, userInfo: [DevicePositionUpdateInfo: currentLocation])
    }
}

let DevicePositionUpdateInfo = "position_update"
extension NSNotification.Name {
    static let deviceLocationUpdated = Notification.Name("be.underside.DeviceLocationUpdatedNotification")
}

