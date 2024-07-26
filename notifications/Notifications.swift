//
//  Notifications.swift
//  notifications
//
//  Created by Aaron Djangmah on 27/03/2024.
//

import SwiftUI
import UserNotifications

struct Notifications: View {
    @State private var authorization = false
    
    func authorizationAccess() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, _ in
            if success{
                authorization = true
            }else{
                authorization = false
            }
        }
    }
    
    func scheduleNotif(){
        let content = UNMutableNotificationContent()
        content.title = "PT Alert"
        content.subtitle = "Please, avoid kasoa and its environs at all costs. If your tedua is useful to you take serious heed to this alert"
        content.sound = .default
        
        let identifier = UUID().uuidString
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    var body: some View {
        VStack{
            
        }.onAppear{
            authorizationAccess()
        }
        
        Image(systemName:"bell")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            .padding()
        
        if authorization {
            Button("Send Notification") {
                scheduleNotif()
            }.buttonStyle(.bordered)
        }
        
        
    }
}

#Preview {
    Notifications()
}
